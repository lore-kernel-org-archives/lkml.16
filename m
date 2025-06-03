Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AE1946F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 01:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748912789; cv=none; b=Vtl+FpzImTOSRzQLsIgGC3VE912y68ayfXSiF8KYIz5Jy3KZxMMT/4Wk5BHuma1vkqKFhSfC9+PcLb6rkuL4POLuaXq0QZkvqspW471QbGO6zzCsT30g9SsapoqOf5/BxcAIO3NlL70o9qifr3voRRYyx6df1me8Y8GJ9dqWdYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748912789; c=relaxed/simple;
	bh=RMWJOZogaV2etWlkqjrll2es/GxO7IMRXY6bKWAVxg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQ5kUoQKC+yNblHrgcUKDhmXhVUXgW9LCDpwRA33v779N3OEgZsAbIc/tWD/Go7HImQ0xR1uuTRrHfugqlsk65JuPrS3Z2DkvShcza403GUlo6RZaDaZangQtO/uBL88SzDygrmSpb/hIvGMfVb1bQfCuqEfVS064czVp3i1v4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDx+yzuL; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDx+yzuL"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-87e7c306fc4so441553241.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 18:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748912786; x=1749517586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMWJOZogaV2etWlkqjrll2es/GxO7IMRXY6bKWAVxg8=;
        b=jDx+yzuL/kUfL1/CMZGAw2dz9Ookh5jciYPjyUvJB5M7QEVpUlncdjeZl9P1Hh4lJq
         b/fK7kEw8MaSO1j5Hmk2ASXNOcOynlJQMQvuYI7wQHkRE4Y/0xejpPV+zqyLbKU4FccJ
         GFiSbj3WzSdrP8TCqAiGQUXE+JxNO/TfIlfSmk+uJtbnQ/U/8UO8ZawwRacStnLrdkAZ
         I375NJjg7S+T3A0LXTZnVx+IqhohBXgBbGl0jLKIMcoyfMHL3RnzKuuL+SWcok6X5YGK
         cnOxWwtr0buCYBtb/1zYhUBujMtcWPr033Z/6lX2lugRiJw8CoZlSf9Yo1jK4hKrlL6k
         0uCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748912786; x=1749517586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMWJOZogaV2etWlkqjrll2es/GxO7IMRXY6bKWAVxg8=;
        b=P/Bq/Yt8dpsN24EPFPxdgBB/dT2LPCz5UMTEdE3BwqOYLoibMfF4ofKuTGuTxJoSFg
         gwTHIgX2J/voKQUZVIrqR1JaTuh6FIkYwW9fIruRWtmrrwlVDlIWVSA2AtcwWzOxBNLP
         p2709K0BOLyuL6lYGXsxB96LohUAO3jBWksPvwc2elioYu68Np5hhzJhNpb6KNpjjrjM
         3D+s+Sw9AOzHKyrzYFbsJO6/bPti+GXq0jMgH1MmRBLbAFkerqmAr1ytL7dd+/1pFh+w
         4WcsTHDZanaE4wMmnq5rtsw+Mbe3BwGua1F/2QUTei2ojwYW/nXBZ70qqqxQI+GTMBZq
         nEVw==
X-Forwarded-Encrypted: i=1; AJvYcCXodsYbhozRN1iTOjR/V5u/VB0AT+ZsPzfN5UmrbtmdXCzUu2aghjdpTGGahxB6tShDTxWggXvS6HYRkGU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc/qHJSlO5x7XIkIvelZ79nFko2PgSQBau5kzSD18vwSAk07nq
	F0Dk6kEPlHfMYaG7prN8Ft47C6NZBLyOVWsWxvWaM/rSM+k94v0IxR4FzfSHNCVPv8CTz5a69JR
	KC6kg+m+vLWniZCNd5C95QKpj628LaLI=
X-Gm-Gg: ASbGncth7bW4kUnBS5ds2uoehGgFiOtDUgldNmAVYCMjoq4maXnyPGfggpQFuuiXxNX
	oLkjgAzRpb17MH1bFP1ggWIMFnDZF1/TcM6VzxVT38Ryi0joY7FqY143HzaQTVQeRzR7zA97KzU
	qJAyecOHD4w/9jzIWO7CYbL0+Jkk1yVUCnLQ==
X-Google-Smtp-Source: AGHT+IFv1DDQlBCn1QAD/Dswpbv0WSJDOOcrkdSUJ0DqRBgPDUm+GITEq9c9Vmq3Itwa3dtZJOKBJZi7cMsZkgXSbWg=
X-Received: by 2002:a05:6102:dd0:b0:4e5:997a:748f with SMTP id
 ada2fe7eead31-4e6ece6d01fmr11278344137.22.1748912786462; Mon, 02 Jun 2025
 18:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530104439.64841-1-21cnbao@gmail.com> <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <002aa917-d952-491d-800c-88a0476ac02f@lucifer.local> <CAG48ez0kb+on=erofZL2ZwB9CqtrSCJVND7K7=ww1prMUGXDRg@mail.gmail.com>
 <23edf435-7cfe-49d1-9432-aee64c0096ab@lucifer.local>
In-Reply-To: <23edf435-7cfe-49d1-9432-aee64c0096ab@lucifer.local>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 3 Jun 2025 13:06:15 +1200
X-Gm-Features: AX0GCFvkC_IF6P1FnyYJWeX09mDj2GXyu33xJdbnsR1KIBqWnbKfL868T9IukPE
Message-ID: <CAGsJ_4znsRvV4CeAkiCdN5snusbUGo4j+b3vhuEfiQrNxnGG_g@mail.gmail.com>
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Jann Horn <jannh@google.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, 
	Lokesh Gidra <lokeshgidra@google.com>, Tangquan Zheng <zhengtangquan@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lorenzo,

On Mon, Jun 2, 2025 at 11:50=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Barry - would you mind if I went off and wrote a quick patch to separate
> walk_page_range_novma() into walk_page_range_kernel() and
> walk_page_range_user_novma()?
>
> I realise this is a pain, but I feel strongly that having them together i=
s
> a source of confusion and having us special case a -only used in ptdump-
> case like this is not great.
>
> It wouldn't include any VMA locking stuff from this patch, which you coul=
d
> then rebase on that.
>
> I think it'd make sense as a separate series and I can throw that out
> fairly quickly...
>
> But I don't want to step on any toes so just let me know!

Feel free to proceed with the patch. I can rebase on top of your
walk_page_range_kernel() changes.

Thanks
Barry
