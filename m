Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E571F582E
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748409734; cv=none; b=gj3TkbhpaMmw79Aulh7xSCTZdJNHzk/S25PhYvfSE8fnlOu2mE9WZ40ozXmnDXM9dx1FWwqceIs81dadJqBlVMugnjM7JkQysRl9uBnMPCDFv6rJE0cNeC3rxyaw76I93KY6PIToEhKqjUcJKl9xvynL+E5t2Na2JxmwfvkZedE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748409734; c=relaxed/simple;
	bh=yXGgj+mtxns8PhzMgNMh2VawII6kvgVSZTxvTe6x10Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hL9MvD8kIEV2AJ8jG2i15Tj5XovU27eoVa98D8dDm6IzAwcmnrEIR7fdbLyVvZOfIPficGfOwJBwyyL4aMwdWXFqMMm4M8a8ei6pH/Vd57BvHkoWQtbTmWNzvU0TA0JBpQ6LcVIWS+gs2RngCm5EccCdWinNmHcy/7iq1CWkDdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rtJ1njK3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rtJ1njK3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-44b1f5b917fso24926355e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748409730; x=1749014530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQoa0JY92XB83bF0hiIU1JdZJVH9XdUX6CbZ3gHnktA=;
        b=rtJ1njK38bjbmRTgcx5Q8nv58SVXSFssmZneBw3MIEIAIvKqXK5OvwIugucZYZGrIQ
         VslXBssJUKpAC49zdn5f+KAMq2ZBWMBw3EKzm76/1lP9b1MIoPoLysqaJGnJSUoWhq3G
         2wMLXZr8oiqPvFnICw71nYb+64a2ZgbXn7MFMOaLJz9b4LHcX9E+zNRTbCj0+8j/AO2s
         L3pJodMkWjsy07LlhIamkxyhZ1V0YNK+MovDBdWzqDWjsFlXEJFibB7lsFhT0DMEI6QI
         AqaxqCu2i0cm+uFiX4PMo0bfO5k4G8kpzdDv5UJ3EnuhPTsKi7DsiXv3nULgs5HqS/ZP
         vPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748409730; x=1749014530;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQoa0JY92XB83bF0hiIU1JdZJVH9XdUX6CbZ3gHnktA=;
        b=i0i8ep/GQZ3NIK0yrt0n2loJwh2OGXPk6NF3+w+Ukk5n2p/6G01xlcvtBnd0iFBcIe
         yaCqUHVWH6utG8zSH8O9RZAFaqbGZ/c2f/CsORM0GznnxbytcWsb6fbjkz2ndvPx2o6E
         0tPQXPb+Pgs3QYMMIf1l9vIopXSHjLrUZp4o8mSOgRKDqswN2jkiV+FanhgY+JXeVixT
         T6d7a9CfQ9LbXeC5YbtjLFp8G3WEpY7OXyWs4QVd15Nhx3Fg80+KQRMBB1bmBsevzLX5
         bxx/75hVFSheG76zz9qaRL529iNdxz973s+xGBeV8gBn1KIpZHZw5if6zCqrHthBzQE7
         fuhw==
X-Forwarded-Encrypted: i=1; AJvYcCVYNnRJKgJA8NDtldlcsRVR/247umTz2SThBaVLroOwIBPxPwn59Lq5uCvxQZU3wGdPGB8RFMtd2/lUPf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGJ6gO92ozoO/Q6rnDQrTDYLhNb/N8EC8Ija+NI4C96WXvUku5
	uza8adoyzmbPRH+S44oVdhjsa8yzjWeLLGUjFyzK1QHZYQbeiOT0y2fGIjaKizgDbqg=
X-Gm-Gg: ASbGncuNSjkPZXl3P5+I8WAhAEYhjvgQIO+ZQQvrm/Lbgeh9lSBRw3IOWB/1FuSMCAm
	cQF8o9d3hF0BCPj9Km4kuVS3M2RAoNm+SHt3QeQiJaBnhLE8e9Y1zBDK28XJ9aYIlwWpEmpt/jK
	EW6yvGNJVTh8Kcl/t1TZAg/5FUGsOOZOSzlrNyEpY8wlPnMeywniQlwGpHli/Mpx6MBlH3SGBdx
	/UgMizUgAcYADBj9eL9aMUspZSMF7fO6zaWGxsCGUg/f2GFemgGB3fAOSUb2eIki4hqdU3qRXFi
	5IlHrs9arHS1VLOcTCiIMdg5958/vA+OUsWj8y1/ffssaQqufeCoM4T8
X-Google-Smtp-Source: AGHT+IFRt79F9Nml3doFVgCAm1e3lBsDWSa75/5HWtnFCBSWr87OHZCH/XypCJ2QyEheeH/6O/16gw==
X-Received: by 2002:a05:600c:621b:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-44fafbf883dmr53519405e9.19.1748409729976;
        Tue, 27 May 2025 22:22:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45072559736sm5617525e9.19.2025.05.27.22.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 22:22:09 -0700 (PDT)
Date: Wed, 28 May 2025 08:22:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Apurupa Pattapu <quic_apurupa@quicinc.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 09/12] tee: add Qualcomm TEE driver
Message-ID: <202505280653.Y79JKqDd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-9-024e3221b0b9@oss.qualcomm.com>

Hi Amirreza,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250527-151020
base:   3be1a7a31fbda82f3604b6c31e4f390110de1b46
patch link:    https://lore.kernel.org/r/20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-9-024e3221b0b9%40oss.qualcomm.com
patch subject: [PATCH v5 09/12] tee: add Qualcomm TEE driver
config: x86_64-randconfig-161-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280653.Y79JKqDd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505280653.Y79JKqDd-lkp@intel.com/

smatch warnings:
drivers/tee/qcomtee/call.c:748 qcomtee_probe() warn: missing error code 'err'

vim +/err +748 drivers/tee/qcomtee/call.c

accd33ce59c3367 Amirreza Zarrabi 2025-05-26  711  static int qcomtee_probe(struct platform_device *pdev)
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  712  {
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  713  	struct workqueue_struct *async_wq;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  714  	struct tee_device *teedev;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  715  	struct tee_shm_pool *pool;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  716  	struct tee_context *ctx;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  717  	struct qcomtee *qcomtee;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  718  	int err;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  719  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  720  	qcomtee = kzalloc(sizeof(*qcomtee), GFP_KERNEL);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  721  	if (!qcomtee)
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  722  		return -ENOMEM;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  723  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  724  	pool = qcomtee_shm_pool_alloc();
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  725  	if (IS_ERR(pool)) {
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  726  		err = PTR_ERR(pool);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  727  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  728  		goto err_free_qcomtee;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  729  	}
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  730  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  731  	teedev = tee_device_alloc(&qcomtee_desc, NULL, pool, qcomtee);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  732  	if (IS_ERR(teedev)) {
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  733  		err = PTR_ERR(teedev);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  734  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  735  		goto err_pool_destroy;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  736  	}
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  737  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  738  	qcomtee->teedev = teedev;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  739  	qcomtee->pool = pool;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  740  	err = tee_device_register(qcomtee->teedev);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  741  	if (err)
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  742  		goto err_unreg_teedev;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  743  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  744  	platform_set_drvdata(pdev, qcomtee);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  745  	/* Start async wq. */
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  746  	async_wq = alloc_ordered_workqueue("qcomtee_wq", 0);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  747  	if (!async_wq)
accd33ce59c3367 Amirreza Zarrabi 2025-05-26 @748  		goto err_unreg_teedev;

err = -ENOMEM;

accd33ce59c3367 Amirreza Zarrabi 2025-05-26  749  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  750  	qcomtee->wq = async_wq;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  751  	/* Driver context used for async operations of teedev. */
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  752  	ctx = teedev_open(qcomtee->teedev);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  753  	if (IS_ERR(ctx)) {
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  754  		err = PTR_ERR(ctx);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  755  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  756  		goto err_dest_wq;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  757  	}
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  758  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  759  	qcomtee->ctx = ctx;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  760  	/* Init Object table. */
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  761  	qcomtee->xa_last_id = 0;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  762  	xa_init_flags(&qcomtee->xa_local_objects, XA_FLAGS_ALLOC);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  763  	/* Get QTEE verion. */
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  764  	qcomtee_get_qtee_feature_list(qcomtee->ctx,
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  765  				      QCOMTEE_FEATURE_VER_OP_GET_QTEE_ID,
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  766  				      &qtee_version);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  767  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  768  	pr_info("QTEE version %u.%u.%u\n",
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  769  		QTEE_VERSION_GET_MAJOR(qtee_version),
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  770  		QTEE_VERSION_GET_MINOR(qtee_version),
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  771  		QTEE_VERSION_GET_PATCH(qtee_version));
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  772  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  773  	return 0;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  774  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  775  err_dest_wq:
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  776  	destroy_workqueue(qcomtee->wq);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  777  err_unreg_teedev:
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  778  	tee_device_unregister(qcomtee->teedev);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  779  err_pool_destroy:
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  780  	tee_shm_pool_free(pool);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  781  err_free_qcomtee:
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  782  	kfree(qcomtee);
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  783  
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  784  	return err;
accd33ce59c3367 Amirreza Zarrabi 2025-05-26  785  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

