Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58F72F0E43
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893568; cv=none; b=k/VIOnWofvdGOtTtWB6yvpEHniM087CU3mhhtWLbRpGvhlTvij4CK6hSwOSYrs9vUez5xWZQtdLGLHPaLqOeJyxbta4zhrcQ/FiY1EVIfTqlHbBnIqOBRNb12pwP6wItXvjlqm5XUsrhy9J9s9HicpMuYAo+bHPZgc/5hyBuA7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893568; c=relaxed/simple;
	bh=RcNYbs1efhmf/4u7FSKyFDgmK+5VrQkZtAduMmc72no=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OV3XRlnlJccGhHmHD1ukHtxXiPGCT63ZCx5ZQdIoOu7VjqNfyhVvu+SF2k61CF1kJcb+hjvSVlwUT5M8VGnaRJsPuj1A+uaVeMDQ4dtbF2bNK9EqjjDbo4sJFmIWoKHfrEyl5reXpemQoo9AJyrhuyGfhUetJJHUtgX80CR0jvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=UhfLI+L4; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="UhfLI+L4"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e812fc35985so335581276.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750893565; x=1751498365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRo4ArwTr+rzDEl5s/rKZCEUFMQwNFwkQlgwE4JalXY=;
        b=UhfLI+L4w2vOEShq7dx+0k68PsM69ZJuJnolkQJVf290inX4WSHRoaWnWTbcGALG2s
         xErwEmK4mGFriWQbwjiWxMSFCiSMEJbogQglUhdxgThTEzk20e/ktQrYgJurtBbbn3Mc
         7qgUg5tBOweM99VcAHl+WRTsT3h6lSdEYah5jD5Q7IlqEHzA0VDRO46r5wHLYixVuepu
         Uzz1tS2iVPFVKYPX4MMPUj3Qm65wqOLP41uT4MeYbDYsv2PPD6qhbEMwcZgMcK69jzuC
         ZDdVn/rJB60PiwgmoFcYgEEK6SjHE8CdJAaSL5CPPrPieRxOrFQIkReKQ07zMYOGQmy1
         p2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750893565; x=1751498365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRo4ArwTr+rzDEl5s/rKZCEUFMQwNFwkQlgwE4JalXY=;
        b=G6CLSZZZxaWWbTynz/0XloOOWa7SucD60QxH7axIxdz1x7gNnvtBw74PZgy1w00XBD
         8Oh4wG7yCtgiHYEepU08U9ZPthQGBCK5mMO5i89Cv7pshyCvuf0OMR31QjBxm+tgRoXY
         NdA+9pw7O+asEsL1WUH4sjeOOBIwlrXjW3a3KUysPRyZ+doMK/WLrvxH4YCiFIv5iepp
         AHCTHOmnOt4Ml8C5x9ObJ1DYZ6+VxLbvFBCunuTCDL0pBVA86vZNNY1sRJvRfx/k2zAG
         5A2Ar6QnDf1itAliMPW/7i5hoOBV78cUBBjosu0c+0pzhudg+2SWsyfeUyUhkEoa4p6+
         0T5w==
X-Forwarded-Encrypted: i=1; AJvYcCUJE8/dCyuFUod1XuBT17oVaiSgDM5rTlkxccrhfbXcW8QP0Zj6m7rqWaazwPOii0SEHzK8IA8GHtVX/tc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3FSc05ITTNWcJEpXAm5jy7qom16AGaiZbVJaR39A4U7fi/Faq
	ng2jBwSBatbKvW179xC15KXY3G69K8IQh7+ys85tExZjy+yHCz99mwsMwG5Y69KLSJk=
X-Gm-Gg: ASbGncsXs1SpdLuVs25KS88qqFBjr81eC1Q569i6GGeYOvIW3IZBAFsEcXRHxnJY3TT
	wrXnGTloUVlLLlffw7jHuGS5Cdiqxu+ZhC8CxVa0MtfAiXb/Oci+ECgp+TR4tACazX/Wft8vbcD
	cnZqWFKrLis8O3EbMDoiCWOg0ZyAEh3WvSgyNuqhKgGjS9IfldIOPVaLwafn468CpygfxT0cioF
	JiiMODAE8B9/+YkR5RKMUoXaPojVSK1DZwVdIpHZTfFdGET0uavrnq3zcU6Wo/NePbRP/firUfH
	1XpglsMYlM5QaYqhW5D2EA+EN1+QWVI1hMUgZe7LlohcppKZ0izycwQgW7lgHOxp0dJhRBb23pR
	Ih0vDWoQhPOea+78YiqPU/YkX9q+hC0fNp6Fp2YNfaQXKFTbayzd2bnt0OaytTAg=
X-Google-Smtp-Source: AGHT+IF/QqEmdOGEafHDFkdYh+DPEw7yVChLh5FM2HcZlMuGRDD+U97tQzodPIWh00zLYdSn83m6tg==
X-Received: by 2002:a05:6902:1790:b0:e84:4b7f:5b67 with SMTP id 3f1490d57ef6-e86017258b6mr5603267276.1.1750893564869;
        Wed, 25 Jun 2025 16:19:24 -0700 (PDT)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac5c538sm3942684276.33.2025.06.25.16.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:19:24 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v1 24/32] MAINTAINERS: add liveupdate entry
Date: Wed, 25 Jun 2025 23:18:11 +0000
Message-ID: <20250625231838.1897085-25-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
References: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS file entry for the new Live Update Orchestrator
introduced in previous patches.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd097e53fff2..90554f3a1bec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14009,6 +14009,19 @@ F:	kernel/module/livepatch.c
 F:	samples/livepatch/
 F:	tools/testing/selftests/livepatch/
 
+LIVE UPDATE
+M:	Pasha Tatashin <pasha.tatashin@soleen.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-kernel-liveupdate
+F:	Documentation/admin-guide/liveupdate.rst
+F:	Documentation/core-api/liveupdate.rst
+F:	Documentation/userspace-api/liveupdate.rst
+F:	include/linux/liveupdate.h
+F:	include/uapi/linux/liveupdate.h
+F:	kernel/liveupdate/
+F:	tools/testing/selftests/liveupdate/
+
 LLC (802.2)
 L:	netdev@vger.kernel.org
 S:	Odd fixes
-- 
2.50.0.727.gbf7dc18ff4-goog

