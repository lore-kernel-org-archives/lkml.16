Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CD723ED68
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 23:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749339768; cv=none; b=Xz7SC/ZwMvs/RD+xHXan+xeyaWGE3XQ3ztpjVuGg4OJFD0TCm8wa3aAb2UkYeYQ09K9cxzJWeNr+nZ5UM0VCbykBYNngriQgDoKes/RMGpXa5QhAWt4JCoLPCzSGIFhk5c56oG2dpLqGbjA7vl2L6vWy/NIp5TwSrM0ULmoRa6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749339768; c=relaxed/simple;
	bh=9k01bgbx1YL2RZUtMK47+/8bRmVJ+L0TjH02CJbfMkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIlf2W/mvhihVc6BCabEfSZaurU01bFFzdf78VGARBqrBaF+4JeHof6BT5UB6OXaTGxpY/WoIDFZrac+fZ4OvS5WHH0bE2vKtUyrQrqbJM/EY3sw7aE3HHuC+ACrqBpa5PkGeM+zlPTF/rRRldwZQCEX8qWbkdeLL3ZgsyQNuPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=IubCc2+G; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="IubCc2+G"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a44e94f0b0so35521321cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 16:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749339766; x=1749944566; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i/syDOAYjJBuSBfzBdkjym5sji/N8QKIGdNQ1zbp8wY=;
        b=IubCc2+GTz3ZnNCqW42UrAHRR/62zGspr3IRX45934C63f5DqIXXt7M7VkKVzjVLyb
         ZINERp9YPbIpH3EqrSZDF/l/X7Z/P2FHXqJidy0bfO5XM5doPRdw5v7z9Aic3HU5wCJl
         gFgcGNBW2nkwASfLhgKehyXsmY20TIvSJTBvY6eceU6AQfQaym4FhGUe6v+3JdUzhK6R
         lkKWVpNv3FMD6KHNJFEkNchodbbgK05NtHeJx00gvJiA5ZXzWR//JfwSbt7MLJZ34ZES
         i7Qh3Mfln/oYqdVsOl5bGbwkYVfYN/UEO1B8wxK4g/vJymKFxsCzW0ncMBVK78HDC2ey
         f6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749339766; x=1749944566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/syDOAYjJBuSBfzBdkjym5sji/N8QKIGdNQ1zbp8wY=;
        b=vhgstn0lowXbWA9THukS2tNHnIwfIAFLLIu0nuAvDTpQ5usX0t83aCEqKZOrdSMUUp
         1JnH9Xc41KxRGOKJlgvXyZr1w4Civ33JKv1blMxljtEb9gASkyxlxpHwL6CU0wrei4Mn
         J12xMey/QbiFRlGFZlApsx16V6nJ6w9ou3LIP0Nb3cxwp7EwMSBJt4rLlnOXqmHi9Nnq
         IVSx13GyR+KjGxsZy/qUBuGCvqDWzKrKs+faIrhWE8FQoKGtH0t+YDpxelJUuLqtBuOh
         l1R3c4VqFObZfe0eOeFZxzLf/LM5hKd8dZV8i/1obGWq1Vp/SysuICs1CZNF76LNZ1FI
         KtIg==
X-Forwarded-Encrypted: i=1; AJvYcCW/InxMzcOJ3TonLVEeSUdLzn1WRWa/CeXeJS3v90+wZRV0hT5yMV4LlimLude3IWzkqWCqdIhQlTFvuTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT3UPPLCWOAZXZQMFyCDhc1CJYdv09DjeEd4MeCRnAWib1XQco
	x2nzD3hYYXLmhJm56CPK8XIgouoG/ET2i0f08VxkvjCt/zCzAyFFIaCVv8lIq0esKQjDSlujf5F
	xEHpEJets7ge4rljXDksbTiHk3aZR5lOsQnzABi/KSg==
X-Gm-Gg: ASbGncszMc7KrUoFfmsuN8wBMOnfPWZKWJ5HJcKLlrDx+nSAlMX5b30PPWJd3uhiivE
	wDvNvkOtepRkkoLqQIBY7ONCPN7I3SYqSTJQdcY8YblnmYgkxVPMHDF9jxmxIMFV5XLqY9YwbV9
	8FMZiwmLtOcH7EEneLcGARSVKXPYWvZcfoZtQm8bR7O6UX7yyOmMM=
X-Google-Smtp-Source: AGHT+IEAgPxUwkqdPhXxzVG+WhF6yaa5uymBn3HgETs0L4z2bdPRdYUl9jyTZgMqsCE8DJRM23RO19BVIQhP40bO/mk=
X-Received: by 2002:a05:622a:2516:b0:4a6:f6fe:a299 with SMTP id
 d75a77b69052e-4a6f6feb21dmr39697051cf.52.1749339766154; Sat, 07 Jun 2025
 16:42:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-7-pasha.tatashin@soleen.com> <aDQY2_XUBY9a6BsX@kernel.org>
In-Reply-To: <aDQY2_XUBY9a6BsX@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 7 Jun 2025 19:42:08 -0400
X-Gm-Features: AX0GCFsxfnExL9Ei5U3kVAWPNmWzqRql6alttjH_jISct21wFPpAUjl8G2uTgGk
Message-ID: <CA+CK2bA-R_Q5psQs+uAYN6BDBkDLB8Zk_jWfZ3Nq2UPUy-kadQ@mail.gmail.com>
Subject: Re: [RFC v2 06/16] luo: luo_subsystems: add subsystem registration
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com, 
	corbet@lwn.net, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, 
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"

> > +struct liveupdate_subsystem {
> > +     int (*prepare)(void *arg, u64 *data);
> > +     int (*freeze)(void *arg, u64 *data);
> > +     void (*cancel)(void *arg, u64 data);
> > +     void (*finish)(void *arg, u64 data);
>
> What is the intended use of arg in all these?

It can be used when multiple instances of the same subsystem want to
register. For example, if there is a host device driver registered
with LUO directly (i.e. devices that are not referenced through FDs),
it might use argument to distinguish between multiple instances of the
devices.

> > +     const char *name;
> > +     void *arg;
> > +     struct list_head list;
> > +     u64 private_data;
> > +};
>
> I suggest to split callbacks into, say, liveupdate_ops so we could constify
> them.
> And then it seems that the data in liveupdate_subsystem can be private to
> LUO.

Let's keep it as is. I do not really see a big advantage, subsystems
can still globally declare and set static callbacks in struct
liveupdate_subsystem { }

>
> > +
> >  #ifdef CONFIG_LIVEUPDATE
> >
> >  /* Return true if live update orchestrator is enabled */
> > @@ -105,6 +138,10 @@ bool liveupdate_state_updated(void);
> >   */
> >  bool liveupdate_state_normal(void);
> >
> > +int liveupdate_register_subsystem(struct liveupdate_subsystem *h);
>
> int liveupdate_register_subsystem(name, ops, data) ?
>
> > +int liveupdate_unregister_subsystem(struct liveupdate_subsystem *h);
> > +int liveupdate_get_subsystem_data(struct liveupdate_subsystem *h, u64 *data);
> > +
> >  #else /* CONFIG_LIVEUPDATE */
>
> --
> Sincerely yours,
> Mike.
