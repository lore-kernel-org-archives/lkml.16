Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576D51ACEBE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880556; cv=none; b=I7CGxl+D1Xh1yWQXz3XVeVoacM+QwrhOxhXHmss/pX/UeckyfgqlIQh61bB3/q8xsIygTdhrtzCTh439VoIVKhBCsnifSiYd6W71wfm4hKf9i1M2x3afVj0ik+/ua2Q9BXdxlMqlXS92+Nbd9oUmUiUymzWcROkHdb+an713ihQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880556; c=relaxed/simple;
	bh=D2tBsdb3UnSTXmAaCpa2ciDxuC6Hr8YSWoqSvbqbnpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNq0TEbtkwU4dKRQuTGdUyDvAJ/Bh6MFzkzGprsPWVZpONDY2KkpFf95EPbOWYnNLe2hO9KH1npd/ZqJWF8Oto3/QQjwHY51HenVqXpHMa/zy5PifEtyqJcTvR+4VuHvWeEcnVojgBG26c0neK/wAjSslhz98EaT0E0hMI5arZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HQZKxtV0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HQZKxtV0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744880553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2tBsdb3UnSTXmAaCpa2ciDxuC6Hr8YSWoqSvbqbnpQ=;
	b=HQZKxtV0hm84MwSwFCRQS10jcd/mUhp4+Un4ic4wwOgCnysHha66p3SJaciU9nfy8UBjqN
	HxROWmocHrfYdKabK2bpkVrb/ofkbwCU7/4HTtfQAP29bEM7b+57DFvNFv0uxuF/gz6gry
	lyOy77bgCaVTml+tT7iTo88Kp92mEQw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-pUbrHOmwNmSCcExG6K_XCQ-1; Thu, 17 Apr 2025 05:02:31 -0400
X-MC-Unique: pUbrHOmwNmSCcExG6K_XCQ-1
X-Mimecast-MFC-AGG-ID: pUbrHOmwNmSCcExG6K_XCQ_1744880551
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac6ce5fe9bfso58450066b.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 02:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744880550; x=1745485350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2tBsdb3UnSTXmAaCpa2ciDxuC6Hr8YSWoqSvbqbnpQ=;
        b=Gak47HSTO1lkHQM6r2Xx8eSmFHlSx3LdyK4xDVHWUiB2fDCnkSJFfYho6uSFCWxWdt
         urxmWlKBZDHPfl8Ec3vsR2prN0XH/4TX0NAi8QQdczuEp04MNnSfqxLmjqq5x/+Q7rVo
         mEXRrOMDW8RQ9tffxS9NknJ+FxYfIUucVcjjYbWjFc8W34rBG9I/7MpwpUQ1wLG67Mec
         wNHQJBEdc4Tg/nJDg3X1+ewvIDDSB+f5kgjaErqZu9fzPZByrlGjCLhy3voJpWPywLgJ
         TVAcbq0S9yNjF4WhujYlsWPmgf1k879yd60ZYMDkWNiTvotfPIAPtiCAjB4tmUDTVRZF
         ZfTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRinboD+lSyAl1Fr2w+mER5U4KNuHlszGUtCEdrp1k6UclXhyTeeNmVeMVw27qfmMAor/+i5Fkk7oVSbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGY5XFC6q1Gqu+BxMkwNV76G1Ns0PldJFqYd43Jmllut2E3SJa
	i686VTkLIDdPgF5pvVLvAEToLQcxxMXTQDIOQHEvPxTDCDOxEYuwWBXxvRVgFT2Aa62V+HthJgI
	COUsY73V5+mAeGYTHxOwPEPIiKQ2DC1zNlpUt3NvFlR1GmINPG5tfUpl8RDCEoRebEt+Jgb1Pir
	bKMxcC9LfwFjHqJALQUdQX/nzq1G0YT5cfeIs3
X-Gm-Gg: ASbGncunvEfGBp06OQJ/9GCAz8aFASPC0Lt57DVoQx4c+lUm1iyiWGNkEv+Ez+3xgp7
	CvgwFncDwrJt/AK9dxssKoKY/QkmR1yDfbU7Bp+2F+6WFb45P/YircQ6fZKPYwsgSNfw=
X-Received: by 2002:a17:906:3e48:b0:acb:5ae1:f6c5 with SMTP id a640c23a62f3a-acb5ae1fadbmr135820266b.3.1744880550637;
        Thu, 17 Apr 2025 02:02:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb4KNK+p3CWd85WSN9F+cxpnxBXzVJ+KIls9b3ZaOcM78ZXSjvUzk7ixBTMuDwSdLOkvTTn5R/+S4eoQzEYxM=
X-Received: by 2002:a17:906:3e48:b0:acb:5ae1:f6c5 with SMTP id
 a640c23a62f3a-acb5ae1fadbmr135818166b.3.1744880550232; Thu, 17 Apr 2025
 02:02:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330184641.1929409-1-costa.shul@redhat.com>
 <CAP4=nvS7nAfrMfb5L8A4DU0ZtGY7cxVD9gTLL-xV9jW3rU1rTA@mail.gmail.com> <CADDUTFzrUz9811qtOyvTObJnB61UoejxdXAqxV5Qr8bB9fD4ZA@mail.gmail.com>
In-Reply-To: <CADDUTFzrUz9811qtOyvTObJnB61UoejxdXAqxV5Qr8bB9fD4ZA@mail.gmail.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Thu, 17 Apr 2025 11:02:19 +0200
X-Gm-Features: ATxdqUH7vVTL8DBezYVAlSOmCYpuAbuI8MELTc-EPtRGesD-_KLLFEKODVH2Hzs
Message-ID: <CAP4=nvQnV-hqNXhAJq0EYggRFq_=K3PRWJ15qutoQhLzyH8hGg@mail.gmail.com>
Subject: Re: [PATCH v1] rtla: Set distinctive exit value for failed tests
To: Costa Shulyupin <costa.shul@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, John Kacur <jkacur@redhat.com>, 
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, Eder Zulian <ezulian@redhat.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Jan Stancek <jstancek@redhat.com>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C4=8Dt 17. 4. 2025 v 10:48 odes=C3=ADlatel Costa Shulyupin
<costa.shul@redhat.com> napsal:
> Although it is technically possible to rely on a failed value zero, I
> suppose it is very unexpected. I expect current users only grep the
> output of rtla.
> I think adding a new command line argument is overcomplicated. Adding
> a new command-line argument for this seems unnecessarily complex, and
> I'm not aware of any Linux/POSIX tools that offer such an option.
>

Alright, you convinced me, I unnecessarily exaggerated the impact of
the exit value change. It's common for Unix tools like grep to return
2 on "unclean" result ("no match found" in the case of grep,
"measurement aborted prematurely because of threshold violated" in the
case of rtla). If users are expecting 0, they can be adjusted to
accommodate for both the old and new behavior without issue.

I'll reply with a review on the main thread later.

Tomas

