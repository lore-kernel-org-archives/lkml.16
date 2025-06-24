Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C1528B4E7
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765340; cv=none; b=OdBodUbolLWjTkpVV+dQs02sPVyYj77S/MxLi2vgTkNkU7Fu1aIpfTxlTtZDACLDHXzoEtvn/AzL7fIznD1ULwlkwyLng30sBUPgJYDjPhE6zPS62N8xIBZtHgEPUvOEUoPCkq3c00XW+4wG3LjPlhXFYIyqq1R/bzVqgQkRLCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765340; c=relaxed/simple;
	bh=o9NtCbdEqXVH///YhmYsCyDbtZ2RQ2t50KFUTbDF7Vk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCreg5PRYdu/CEkg3SYFd0ymPuYgdQE0hLe2r4BtV+r2ZkwdGcmaEFxclpeaeIRE+Om6XYkmruoFgvw03g29EkQnkfTm43Kcpk9GI1fnnnBiCFtor5zio9kIyh2QE9Y6B+XR90b51kEf/ca/LKd69eXwDySghjr4BFPl6kUK3/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l31mpb6+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l31mpb6+"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54e7967cf67so5001414e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 04:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750765336; x=1751370136; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5s25fyGVsgH7CUUdiHpgC4SpMceOJi2ulartzmm/61o=;
        b=l31mpb6+r0ux3+Iojt6x6WBy/DIedw1d31V2I9LZrZwkfXzjIigifOtu2QAAvJiZIG
         DJcTL/Fwek6eo9dhkAxdbmGMoNruoOndr7CREoKsqBh9KF/iqSQ8LYRxOXFveebUpTOT
         RmarYAQNI9Dqzw3OgJ92sa0yDsoWvlJAb9Xj/sqSNBVG2q/+psoJHymwiFZvJu2tUvzi
         q8XZhntjCx5LzhgT6nqM+yDNgHBO8TCHB9J1+cMH//HrOqVZFDbtVETnfqCE2S/QEHXc
         940b4MkZydZvoH5tzsJ1lLAlcCbMqZso5XuZmin0vh+FpRoMyILO8AhO4UtHnQw1Fu1N
         zuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750765336; x=1751370136;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5s25fyGVsgH7CUUdiHpgC4SpMceOJi2ulartzmm/61o=;
        b=A0oO3um9/cyE8Zje7FurRhXfX9zUFSxaoyir/qtZC6uimM0HXzqMH8dQRGzjFLsa1j
         26AnS20DXyvbmrW8CwepxofSTTKALJWHeDT4bkL0Zpy9rksuXtF/kEVpKEpjwAyNc/wy
         yaJiCTUPcmBDS6ye6U3cKgKurBYnC+V5iJyr0/jLCePulzQlW1nnibiexP0WC1NVb6b8
         /D+Ztc88Q/C6nCwp8HXJvC1X0KcipzZ3U8Wm2NHF+AgH7yF3o44HppvxOlUl8PChD5Z9
         9yz3+/NC5tWDquJbTz9rwENvHBW6MFbMKIc4Unbr4fQdZy3oveo1XzsodMlNGxxPdIQu
         T0BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEAnHxCALVIHYaxfXHTvSDRrzOfxXCJ70e6Q6nvrG+OlWjhc6mekTc0meNHIntbFydLcgaS/ZAuR5AvA4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl0/V1vZRUec+duSnfer97TjSMtcr61cWVU1iPsTP3VM0fun/5
	VYgWfT+GEVBrNcO79bwqLZeBfLQNJgt3450N79jvoK30Kcfp0n0JjLMO
X-Gm-Gg: ASbGncv1gmoJlITHFXXrVg3tWYfV0Kyzg8ueYg5/6Kbjxn59AQPtnFi4f7oLwwjtnsP
	76zk3u/Lxk9pR7cODAtPoiUa6WJdWNDtRS6PThHlm4bNcWh2niBPMWlQLLv0IKfW4M2l1gcMGxY
	qIdVzTLvkRB+3pMs/AGrFxciuH90m7OMFisp4SBaqJ4Lgt9h7UXqnPx260dZCFnogi56o0T4BY3
	C+qcmOMgz0tbpo/WkFv4bd0r5hxKEt5Y3zqgZ0xBYjNcw1aqVB8tb4CMOlQj9qC/XliNeW0uxJr
	aRzsCVPW69gO+8E+XphQrKXf7i7iO+OlEB+iYQcQqNSpc40gqo1/eQICPg/g944Zf1ZTlSKNqZN
	44FUcJKkQtkg=
X-Google-Smtp-Source: AGHT+IGmukpKZCpvBS9DnXJ5zF/aXj7ll7dmnJzveDXO4jN9B/KEDcKBMAx2bSwr80gt54+0Qzco9w==
X-Received: by 2002:a05:6512:3ca5:b0:54b:1055:f4c3 with SMTP id 2adb3069b0e04-553e3ba8018mr5596807e87.11.1750765335508;
        Tue, 24 Jun 2025 04:42:15 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ea450edfsm1430158e87.102.2025.06.24.04.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 04:42:14 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 24 Jun 2025 13:42:12 +0200
To: David Wang <00107082@163.com>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 1/2] lib/test_vmalloc.c: Use late_initcall() if built-in
 for init ordering
Message-ID: <aFqPFPmR1sZQzMS0@pc636>
References: <20250623184035.581229-1-urezki@gmail.com>
 <5686796f.8f47.197a1310b6d.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5686796f.8f47.197a1310b6d.Coremail.00107082@163.com>

On Tue, Jun 24, 2025 at 05:07:15PM +0800, David Wang wrote:
> 
> At 2025-06-24 02:40:34, "Uladzislau Rezki (Sony)" <urezki@gmail.com> wrote:
> >When the vmalloc test code is compiled as a built-in, use late_initcall()
> >instead of module_init() to defer a vmalloc test execution until most
> >subsystems are up and running.
> >
> >It avoids interfering with components that may not yet be initialized
> >at module_init() time. For example, there was a recent report of memory
> >profiling infrastructure not being ready early enough leading to kernel
> >crash.
> >
> >By using late_initcall() in the built-in case, we ensure the tests are
> >run at a safer point during a boot sequence.
> >
> >Cc: Harry Yoo <harry.yoo@oracle.com>
> >Cc: Suren Baghdasaryan <surenb@google.com>
> >Cc: David Wang <00107082@163.com>
> >Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> >---
> > lib/test_vmalloc.c | 4 ++++
> > 1 file changed, 4 insertions(+)
> >
> >diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
> >index 1b0b59549aaf1..7264781750c96 100644
> >--- a/lib/test_vmalloc.c
> >+++ b/lib/test_vmalloc.c
> >@@ -598,7 +598,11 @@ static int __init vmalloc_test_init(void)
> > 	return IS_BUILTIN(CONFIG_TEST_VMALLOC) ? 0:-EAGAIN;
> > }
> > 
> >+#ifdef MODULE
> > module_init(vmalloc_test_init)
> >+#else
> >+late_initcall(vmalloc_test_init);
> 
> >+#endif
> 
> 
> When MODULE defined,  late_initcall is defined as module_init in ./include/linux/module.h
> I think the MODULE check here is redundant,  (it is clearer though)
> 
That was an idea to use MODULE, because late_initcall is designed not
for module.s It would require the comment then.

--
Uladzislau Rezki
