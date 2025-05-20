Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1420E283125
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747772835; cv=none; b=tr+PbqPL11bPXMNRyrql4cLPJLvhBVzwUDg8nCvqaCVDj7mlZGLNs+EuPOHK01mREksd9Fu5UsBzP8FluGRWsZ0mB4YL/fnaMdsJDCqKirxkbkv2alx8CNZBk/lnU032dTX15N8VelA8xksc54nyu9xtA/RUoDG8F0hWeK1v9ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747772835; c=relaxed/simple;
	bh=byTi+sAOTj0x56q0zXwI7gx6OBoBWQKhfumi6kPLa0Y=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=oQu7Rcx8f8oVkd5NsWTemDANr2WuiacE38hJ0Fj5JkRkpou0g4vFQa/i2BOHu9rocLdN69Nk+SjnVgyDlpZoiKs73AtEP+rFwqV5o/Xu4xk2IIgUdgOlUvN2Leb4btwZ6sqFn/fYoW9k50sp2tZLk065k9IWQS0NOGjH0rY72Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcDL+dyh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcDL+dyh"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so67010945e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747772830; x=1748377630; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byTi+sAOTj0x56q0zXwI7gx6OBoBWQKhfumi6kPLa0Y=;
        b=GcDL+dyhZTXvSaVAHeJG2hOdVpRveAUwTj+Crh4BkHSVCARQBMHhnkuc5e7ZZJirOP
         80c22dB6mlPdC4HX+MMuXpwq2RSRJ/wsBNQ0vE8W0mO4TGnXVSVkxZ0G6/k+Qk91mR6x
         zakUIlhIKSeYxbc+2PDqbysxEMQVQpMnXacVDQn1FfhzsQ7VAzs5vY593wQBSrAzErQf
         GXjhWA1XT+dXxn6n9D7ZeuuQ/pSribUGxn4kC1Dvo/RGnZN8FV8MwSMpB9pKOaq2OlPE
         JxPd0vbKxdNqYc/J+EoRp58N0TxDlwMcfazgRGSi6N+IWgsJvGhzD/Tyv9nKUQf0EFP2
         slAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747772830; x=1748377630;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byTi+sAOTj0x56q0zXwI7gx6OBoBWQKhfumi6kPLa0Y=;
        b=cpbcVRlb6UBGVCDdzAInyGC1l+ejy7Ta8/mBu9BVP6w563yOodDpQtEhB/8gTc4wLr
         qvgRxLXSnI58Z8GOWIr90b2CE9mWxMkBxotvv7xTOE49MB4YoOm6PxriPuH4QgbIG4as
         93Z7oaTfwAlIiPrp3442jvxWnYP3/dCclL0nmUghndCLCqoIvSTnxNj1bV1KWthJCabt
         1gcKdh2ki5sHwkZ5OZsMG2Ep3yZ0Df7JPp0yTzHLJ12d2BXz3u80b5AAzYiaRLdshgvX
         Quelb1SzaFZxJXoUt6ADBxlvs7No22ojWLMjkc2M9+42toJuJMf1suxzkX/8oetlvExf
         qYxg==
X-Gm-Message-State: AOJu0YznXRsHaxYlC70Nys1TkvFVd3FAszfqWB/mkgzRAUEgg2QHKgRO
	QNl4Le3EiLndSHGNDvKiZbNdMf+wGO+fLpuBgXMi9KVAb9ZDJAK4dlzj
X-Gm-Gg: ASbGncvBRCiAmEJ9HMG+BHhGANr8I4zBOKIebnJ5bkm0jRn17eZoEqme+E+zAaA2k1h
	wn9poPeeLVLTFIJhzaZ4aygFbRXBzoK6DDEVQEnN8cEvvq6B/J4YnrLcwppPVoJjcKhFoBejPGx
	bR/gmDirW4UOy9nMOHqtRdIGmA3HSlKPqxGDz48uvOv+8ERrTLu/wOBcuushSVcWBS6FWbVbNob
	z9YH7iaRTWTiVHgTJ/zNbxJj8DFUk43i9GdOir+9AjNFTIWpBr7Tw3us/O7ufbzt84+ufdlA5Xd
	1X+qRcOTJhQmbAJdkGMOLrPQuIUmrQuhkSXbb0w1MuOgUX0kTxTt4VMAY+IC07ZspMpDEldMX2x
	p
X-Google-Smtp-Source: AGHT+IGxPr0xo/HVPVanixrOZ+HQ5nEzm+pNPHc4gMNp7DrOfzd7JQexs0V8oLBvyq2q4bzYRs6nTg==
X-Received: by 2002:a05:600c:4f42:b0:442:f4d4:522 with SMTP id 5b1f17b1804b1-442fd60a5bemr168457955e9.5.1747772830152;
        Tue, 20 May 2025 13:27:10 -0700 (PDT)
Received: from smtpclient.apple ([5.29.20.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f45a8434sm46613305e9.0.2025.05.20.13.27.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 May 2025 13:27:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [RFC v2 7/9] x86/mm: Introduce Remote Action Request
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <6a3290319031cd68a383e416f53aa7549bac9407.camel@surriel.com>
Date: Tue, 20 May 2025 23:26:57 +0300
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 kernel-team@meta.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 luto@kernel.org,
 peterz@infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Yu-cheng Yu <yu-cheng.yu@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4009A0C6-CE5C-4197-9F48-3805059C214E@gmail.com>
References: <20250520010350.1740223-1-riel@surriel.com>
 <20250520010350.1740223-8-riel@surriel.com>
 <4A879001-E213-4239-9D25-CDA8EC3E2CD9@gmail.com>
 <6a3290319031cd68a383e416f53aa7549bac9407.camel@surriel.com>
To: Rik van Riel <riel@surriel.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)



> On 20 May 2025, at 16:00, Rik van Riel <riel@surriel.com> wrote:
>=20
>> Putting aside the rest of the code, I see you don=E2=80=99t call
>> should_flush_tlb().
>> I think it is worth mentioning in commit log or comment the rationale
>> behind
>> it (and maybe benchmarks to justify it).
>>=20
>>=20
> The long term plan here is to simply have the originating
> CPU included in the cpumask, and have it send a RAR
> request to itself.

That=E2=80=99s unrelated. I was referring to considering supporting
some sort of lazy TLB to eliminate sending RAR to cores that
do not care about it. Is there a cost of RAR to more cores than
needed? My guess is that there is one, and maybe in such cases
you would want actual IPI and special handling.

