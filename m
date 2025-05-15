Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DEA20C492
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321328; cv=none; b=tco1op76RhYTO+kB++Pi3tJVmDRkmzGCZ6Go1iFjN10+/Pz2CpujKpSauwUcI6kx9VjMJhryHwPUI5rCnjG68zN3BKsgrwQpBYic0J/X3VFFNAd5NDbRXBs0VwhWmcIpL8ws+Tn55dZ/5v5vCMYguUHGAu08SVTX7Am6YOQ2g5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321328; c=relaxed/simple;
	bh=rX0s2QYnVYFJWqRAuYNWPcSnMx3/HZszG7QwJ/X9lD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMtURldJBgfmdJDEsDwObek5KtJ8vGvL3TWQMvEQcv7ICxnL/AIWX0HtNOtUW/6PE/Ytneq4XDV9K7THGQDVDbxbk0uBhxNXWh4w5jkk9JzsC+ddMW2ziWonQaH8cIDh4wK4kzdHhscChDE6ZVA6eNRtPRsy/WJqrt68jkGaHEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lPRg3cyT; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lPRg3cyT"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4774611d40bso318291cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747321325; x=1747926125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rX0s2QYnVYFJWqRAuYNWPcSnMx3/HZszG7QwJ/X9lD0=;
        b=lPRg3cyThW15+x2pe3WxNZhZ2EMSy9wb5xQjZVdyLGl5+Hgo9ufR91mmycLm6SlIpw
         5M7hmvR1q+zfofajQSAHvTyuUai7VCdDpD6HBSbMv0aD5i4tZt2f95coyHTjMbZ8jBSh
         6Ii4pMhDv5SzPCeAL2JRZ88CDHhvy50u3LMSRFH1evPpXmDdKuSJt5CTksKmMIwoTeNY
         fNCPWV6pyT0vFzWiuUmRsFrg7tfLsgxgg/BWh9SMRf1rE7Wzzgw+ikZKhPefCXP0HFL/
         tEBK93zxfps5d7t7/BW+3d0FjdDEB3dM3TkVrmnFPkb+QXF2lFeWltaFWSvOY0pOIdVN
         eAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747321325; x=1747926125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rX0s2QYnVYFJWqRAuYNWPcSnMx3/HZszG7QwJ/X9lD0=;
        b=OdCJv3LopvVcLJLZARm14DfTPgyLmTJLmSLTUJBs+GSyCNj9GpFbPj0ajAX9MFEKYY
         On1i8xvBEiIIcafOc34dYY16Tz26yo15bI2zdUXeDe3S12Qy/+ew93RY+opr1tUiMVXk
         4Oqn/1uTekYvXutNVBD0bVvraW/uje8Boplk4VUHzA4JYKgArMVMezvGRw4LD4jtPDYy
         2fJ1y7YwwWDHyBk4ZH5a2cmihyElor6EqDPd9YYuUeQlHrMLGLL/puXuMmoiaRhFdCAp
         y0mcuFPwwD3iXmBmwypqpTZVp64+Myk06C9JBhxdqZI+0Khot/oNBQVertGRP4cl+uDJ
         nCxw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ2lmbeV1x+Hs0tHvxbQ5iVQeGvU+n3fJIQCe1GgDHmfYwESXLBraJ4Oq9xJ0/q9Xi6K/ojDTy49BZCs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC/Ov18Hh52H4BscY/Kt1abfOSX9bx6uCz7k3Ms+LCiPFQNQBa
	JV3ayvMSqHeOY5PsvxbbReDFqTvIu/H7TQ/ye/VjnVo9kXsLqLwJt7LGwqSIKgw68N3/hPHd3it
	IH95gYhPzHsbGQZJ3KmsKhXDSLjr0TTtiZbMkNuwt
X-Gm-Gg: ASbGncvOByBdAobPM2vh7LYybv7cJuAgVPESqn2bCJuJgQTY6wyhgLVlCfKgMwkUV+k
	0DPTepLlYZfHWl/n9+QLpb9479usRQhVkIheSLZS86pW6eJB+IoVSP3srhMpsaDg/WGS1CJaXUa
	GHakelE1gcqXPLx57mOJorDVgNR6A0+p2UzEMplHD+2N0MS+bwRAeeOmxLDPndnQ==
X-Google-Smtp-Source: AGHT+IHlN4zcoE/AVgqKFO6PNyDAs0OJWk7DAZ9l630dsKTZOK6vvHYJigslJVBGvvhholDbFz4KBp/F2GL3Hwxq5G4=
X-Received: by 2002:a05:622a:243:b0:48a:7cd7:7e02 with SMTP id
 d75a77b69052e-494a1dc992amr3943931cf.18.1747321325103; Thu, 15 May 2025
 08:02:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425-slub-percpu-caches-v4-0-8a636982b4a4@suse.cz> <266cb5e2-f946-414a-bc08-193c7e6e5f19@suse.cz>
In-Reply-To: <266cb5e2-f946-414a-bc08-193c7e6e5f19@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 15 May 2025 08:01:54 -0700
X-Gm-Features: AX0GCFt0yj9GDMcdc4GBxWZEFJDfafuu_5skAXnZcVY2juBksjM63TxLUcwCVqc
Message-ID: <CAJuCfpHFnx=XskV3driqyY6pSeOFgYzgwepVS3MudeQ50Vv2Mg@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] SLUB percpu sheaves
To: Vlastimil Babka <vbabka@suse.cz>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Christoph Lameter <cl@linux.com>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Harry Yoo <harry.yoo@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
	maple-tree@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 5:46=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 4/25/25 10:27, Vlastimil Babka wrote:
> > Hi,
> >
> > This is the v4 and first non-RFC series to add an opt-in percpu
> > array-based caching layer to SLUB, following the LSF/MM discussions.
> > Since v3 I've also made changes to achieve full compatibility with
> > slub_debug, and IRC discussions led to the last patch intended to
> > improve NUMA locality (the patch remains separate for evaluation
> > purposes).
>
> I've pushed the changes based on the feedback here:
> https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git/log/?h=
=3Db4/slub-percpu-sheaves
>
> You can use that for testing/benchmarking. Thanks!

Thanks! I'll give it a spin this weekend.
