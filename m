Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76E8293C6D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530059; cv=none; b=EyNslt7Xc8GPycTaanXDnjcbrRT3ungvIwAF+HLdrFYAJtkhRDHFNZEYbPKyyukS/7ewK+zpiPeXnd1/mHK//TsTcgNQysLVFCwOTIzEWE4EGrsQ3i9duXO2wMgSSpAUWj3lEYR3zzKVBUgu24kHX4JjKiGyvgGaRV2Ij2Evk30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530059; c=relaxed/simple;
	bh=XEutOZDpX6mO+OjsZpZ8b1EIpGfFQ9vBDyzxOYvDMnI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b48iffMSLVj7qYghopmAZZdwX5T5H+Uyl7POugwX955J+Q10YL15EcKkoImdo9h4qDcek7kq6l4zOHMBNGgvolAWDWvCJ3HsnVUoOMznHA+DT41Qk3EZ6qeIUADw8tYQQqk8flvsJssbUmveqQToukIdFGTv+nxgf8dhc8Seeko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PdEFPkFc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PdEFPkFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751530056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GamMp+TyJFc30zumQdIUpdnv7sTzaVAQHgSIzM4gVf8=;
	b=PdEFPkFcjb5QvQQysBlF/Wb5W8KXHDJHPpffx0cPOntKafrsAgGT4oM8WYofgvu024803I
	ey3RT8SrBa8AZh0Z1I+Hq154ACKqf4d5r+RBbjV1hmdLmHgSzFsKMaHCzmm46rCTJPtMRP
	p+k4vcHaEYupAhQb1ILpdPQtT1HnPbQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-W3Dpr-XeN0Seut0nyPnrnQ-1; Thu, 03 Jul 2025 04:07:34 -0400
X-MC-Unique: W3Dpr-XeN0Seut0nyPnrnQ-1
X-Mimecast-MFC-AGG-ID: W3Dpr-XeN0Seut0nyPnrnQ_1751530053
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so3811418f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751530053; x=1752134853;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GamMp+TyJFc30zumQdIUpdnv7sTzaVAQHgSIzM4gVf8=;
        b=JnJXp3JTmrlYVoiczqUuNsTUCSWUdVGIlxc6G5HinQJJLTzUvuW/VQGL9Npsth70v2
         1KhvS0U3klhOUxhuxLep5mQWjJlDq02BFMc8EDVdWg/2xumg8uyosB1coGlSPpNzEOvK
         TFLVVVlkTJbQF3WRy8t2VXH2tb5CiqqlZiLayagT6h+b+UzNwb/CYYcNgVx5yEcm9Ddg
         W83nrFAkrrpnYlYJ7dEl8dp3IuUoNfT163gITz7euuMQfbe9dMpEo5H0DwX1rk64xOJ6
         PwxW8N1DdSZbdCWsPXVjAMBiwJSPs+d6UvkTjdFVqj4DH2DSC0gpBJYp9dx2WHknrhP/
         hcwg==
X-Forwarded-Encrypted: i=1; AJvYcCWTuHMkh+Z0WHwbn+AB8zjh3LO1uR3PEwYHetyBP7y+AYP1Nrcuc/xf9nvoUQMOgpoR+WviT+hcC33EuwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLVE/Xyg3vU3Rhdpt7QsiHQvsUZVw78G0tbtayK71T1B6SvqER
	ZwTkMkOAZ0m0GfsfsiLtEzXkhRTQx+kZ+yht+ELbDd/knKfBP5IEyoqeNOxPZklIln6iLtibRcX
	i96qBjfROOo6CKV6N1mEjlXkvOFApEuFE7geXr01/QDoqd2nSBKzXggcrUvJSUwCW+Q==
X-Gm-Gg: ASbGncs/KAIt56CdugYTl2PB7ysLwwI4NKA5D20hXCLQfoEozr/w8pGCCCtD1udoVod
	3qNBDEbrmv0WOkZPIP0Hg1FHI2v+xFB2kS4jWfdL0vCFMbaeRXkZeoE+BMMBE+vTiKnnVi3gkJF
	ntYqg5T90Ic8XMAmLHv9BnNA1/UQusKUMku6fxe5aI50Cd7xwVRGlH0Ycj4vAj6DuqOEbGMz7XT
	w48g6ncNVY4on9/usEbMfb78e36cNF2JaR7+mxGiHaOCyoQfmXYLUp/qB1rg++vOQtdSEp3AEd+
	eAzDvS4lAHQBBk2APtJt06CLs9zRDvhdNBrN9JQWpwQhzArU
X-Received: by 2002:a05:6000:21ca:b0:3a4:fc52:f5d4 with SMTP id ffacd0b85a97d-3b2005840cdmr2948557f8f.47.1751530052841;
        Thu, 03 Jul 2025 01:07:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG05IT0UewuXSmKOoWgx9Nq04Gs+TXwgHPmEfRpAXHBlO7HuRZUAMsKy4Nw2TO9gr1qifTV4g==
X-Received: by 2002:a05:6000:21ca:b0:3a4:fc52:f5d4 with SMTP id ffacd0b85a97d-3b2005840cdmr2948523f8f.47.1751530052307;
        Thu, 03 Jul 2025 01:07:32 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f842sm17623149f8f.86.2025.07.03.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:07:31 -0700 (PDT)
Message-ID: <564f10574f11bd7ca42fcc5fb4d6c5625dc17205.camel@redhat.com>
Subject: Re: [PATCH] tracing: Remove pointless memory barriers
From: Gabriele Monaco <gmonaco@redhat.com>
To: John Ogness <john.ogness@linutronix.de>, Steven Rostedt
	 <rostedt@goodmis.org>, Nam Cao <namcao@linutronix.de>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
	 <mathieu.desnoyers@efficios.com>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 03 Jul 2025 10:05:59 +0200
In-Reply-To: <84o6uatn6i.fsf@jogness.linutronix.de>
References: <20250626151940.1756398-1-namcao@linutronix.de>
	 <20250626113520.315db641@gandalf.local.home>
	 <20250626160459.soHxOROG@linutronix.de>
	 <20250626123445.5b01849d@gandalf.local.home>
	 <84o6uatn6i.fsf@jogness.linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-06-26 at 19:47 +0206, John Ogness wrote:
> Hi Steven,
>=20
> On 2025-06-26, Steven Rostedt <rostedt@goodmis.org> wrote:
> > > Your scenario can still happen despite the memory barrier:
> >=20
> > Yes, but the point isn't really to prevent the race. It's more
> > about making
> > the race window smaller.
> >=20
> > When we disable it, if something is currently using it then it may
> > or may
> > not get in. That's fine as this isn't critical.
> >=20
> > But from my understanding, without the barriers, some architectures
> > may
> > never see the update. That is, the write from one CPU may not get
> > to memory
> > for a long time and new incoming readers will still see the old
> > data. I'm
> > more concerned with new readers than ones that are currently racing
> > with
> > the updates.
>=20
> Memory barriers do not affect visibility. They only affect ordering.
> And
> ordering implies that there are at least 2 pieces of data involved. A
> memory barrier has no meaning when you are only talking about 1 piece
> of
> data (in this case @buffer_disabled).
>=20
> For example, update_traceon_count() has an smp_rmb()/smp_wmb() pair
> to
> make sure @count updates are ordered to be after @buffer_disabled
> updates.
>=20
> read(count)
> smp_rmb()
> read(buffer_disabled)
>=20
> write(buffer_disabled)
> smp_wmb()
> write(count)
>=20
> But what exactly are the memory barriers removed in this patch
> ordering?
>=20

Hi all,

these statements made me curious: I always thought of memory barriers as a =
way
to order reads and writes to the same address across different CPUs (in oth=
er
words, for visibility).

For instance I'd do something like:

CPU 1             CPU2

write(x)
smp_mb()
                  <implicit paired barrier>
                  READ_ONCE(x)

Now, I get there isn't much we can do if reader and writer are racing, but,=
 as
Steve said, I'm expecting the presence of barriers to make the racing windo=
w
smaller.

Am I misinterpreting the whole thing here? Are those barriers just ordering
reads with reads and writes with writes (hence useful only with multiple
variables)?

Thanks,
Gabriele

