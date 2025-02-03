Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A5A25A656
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738611363; cv=none; b=enjw/19mphj6b/1TmRvSRF96uC4SfvWc/HzPx+E/gJygHgvbz+T1hmHyLRO6FaKEyerHdb34wHDPN7HPFsA+5Jx1kDosAUwsAXtauA8fLaTkwThKjygWfz0Kk2uIXivj+beVOdGxozU5QE2NvssmP/idnvoYJkQ7Gq8Yz/L69Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738611363; c=relaxed/simple;
	bh=bvEwELWo1hmF/LOazsIfk+QCavwrmzoGhmxie4UORaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=jvXhHOpUOzw0rUjbmM+pEg8hUWIgQjuvFuVEVqs5Dg5XnrDqq/MKd9lD7AwHryiFCUmTuMa8guqgj/OCYrN1ZqcUvktf2mAIOKpfp1/Y6TH9zyzmydTEFJ7PEC6SzoA+mZUbu84yHssxgZbrcVRuddU9Pj4ZCrIj71++KPepezw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikU7HFjx; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikU7HFjx"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so7472407a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 11:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738611360; x=1739216160; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAstuYTMbZE0qrtF9cJ6rOhreqf1rnWhSmN6+PF3EzM=;
        b=ikU7HFjxQl6Nv2gETGDmbttOkxoGSerWvUhuj1LJIoHtSHPkB10Z9lAQU9KQmjSFi6
         TorV7VtjZTDEiyjvqBQ7vKF36Ly3IW3kuyUXwbV6L1NRYO4xAU0hHczP8Nko+KGVLTvW
         AKZ1BZ6U0u1MW8fyDdcX24NtKUL+PL0EESCHePFaEO5BAWCGG823p8i6D5uKQa/mE80w
         Kpvba/pPJve8wtpyn+HBFklaDAp30RuAd9ENZslB9C+aNTqnFghOvC25ARz3murMpvU1
         JyKLqiJI6S1J3qeXNJy7E7IiaAai+USaIvcYXJ4IL+L+irV37TwGkcUx3CXMbfdq4NKJ
         n0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738611360; x=1739216160;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAstuYTMbZE0qrtF9cJ6rOhreqf1rnWhSmN6+PF3EzM=;
        b=VmVjzVY+mAOSfXvF6ZFpf7g68NTxwbugaWWhOuKHnBfo4ddyVX8yrrN6gHaIau+SgS
         t06YGLepaFnhyrMELodSguE0gFm9Dbc+Qcx8T8kR3N7yJ2Z6e2rTsjIAaPyKYSq37GyM
         76ghT/P7ZVjaeMV9wG9Mwq7sOiE0jnzp32bHgXgMxNmsP+C1ddAbOSXcBSkWUsCROR4u
         L4/yxjm+RFpRj7nKwWIB15PQne6p4BxWlWOUo4qMIoU764Nluckj5gfeikMflyL5VUq4
         3tGQEBcMauGaFlP30F26S+3PZ5EuZFIQzZZ0WQcDLs3Tww2N8V9M4B1rs/TDGDf2NX8K
         Cc7g==
X-Forwarded-Encrypted: i=1; AJvYcCXvgigMbW1fpyDPt1YtrFPdSgzUXJLEmGoaMxma6Vh6dggWVvS8J166EcfChErZpbyoCITVHPfPvvHFKq4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7CXyO0rXGTEwsLuZWCxjeRE3sBGqY+sWmHdhS6NxeTPXsHaeF
	2+3veNqtqLHHL43GyzPHE2elfyo9LvHOyTmBrITpcR3lLGkv9/SSq7XWalM7fOlxvM4zTtds+P5
	JiI3Iaqozje4Vl3usHhu7UfdVxf8=
X-Gm-Gg: ASbGncsmdjdk8fcS/8Dgr/w49AMl0sLTn7qzrItzOt1m4FHNk6bxmxA/PwZ8qKSUxSG
	Shdcm0E/WJGc/vP3PlzpmM6izkvEYKZsHvLn3hFnshMbFaN2d18qe8DXiPwmYqUaPFWQ/swM=
X-Google-Smtp-Source: AGHT+IGeMTHuN/0JSO91BeMCZFiSn8gHl3uo8POVLHDeTxyTvc0byZZ2VpnOtK9DLMGXNQD3kzBY4MgMf3fO803cMDI=
X-Received: by 2002:a05:6402:248d:b0:5dc:8f03:bb25 with SMTP id
 4fb4d7f45d1cf-5dc8f03be9bmr14578201a12.6.1738611359526; Mon, 03 Feb 2025
 11:35:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201163106.28912-1-mjguzik@gmail.com> <20250201163106.28912-3-mjguzik@gmail.com>
 <eqoac7dyanvez62nc5ge3lfxxxbjcln3k6nrz4tkrg67v55sdb@sosx2sguy5f6>
In-Reply-To: <eqoac7dyanvez62nc5ge3lfxxxbjcln3k6nrz4tkrg67v55sdb@sosx2sguy5f6>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 3 Feb 2025 20:35:47 +0100
X-Gm-Features: AWEUYZlN5FLN86dLDxhRIFZLTCtjwPj4wT1oi8RLc3hX9V9tMRTeDz0lWOGiJt4
Message-ID: <CAGudoHGXR-vnYm-wMs5c8EE448UeuEps3ecrf_g22Mw=9oQtLQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] exit: hoist get_pid() in release_task() outside of tasklist_lock
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>, ebiederm@xmission.com, 
	oleg@redhat.com, brauner@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 8:27=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Mateusz Guzik <mjguzik@gmail.com> [250201 11:31]:
> > Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
>
> Change log is a bit sparse?  I get that the subject spells out what is
> done, but anything to say here at all?  Reduces lock contention by
> reducing lock time or something?  Maybe even some numbers you have in
> the cover letter?
>

I did not measure this bit *specifically*.

As one can expect get_pid issues an atomic and that's slow. And since
it can happen *prior* to taking the global lock it seems like an
obvious little nit to sort out.

I would argue the change is self-explanatory given the cover-letter.

--=20
Mateusz Guzik <mjguzik gmail.com>
