Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A464C296D25
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745866976; cv=none; b=FpHzpU/ahivfiwTbE9pMAa6Me2mAyagL7qQ6nOOGsMlDBRJucNR9wHxT2/HkPa+ANuPGK63kfROBXTbzTeHZzBSQTSKryX+luC0G5tpjoJG8fORSMiZvz1eCkuEtdU9uGkE0Q5pzm8/R6OwYcx3kfmbLlwuESMEG6+CdY6wKF7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745866976; c=relaxed/simple;
	bh=81G08v+RqUNeKeO9J3EQnr/p4nVDb1PF8OFcGNlg19g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9gSM0HcrEnEY80PlC+zPb/JNYgCfzYPqBvaaxMhFeKznhhRlR5WhVXuao7AtRk4K9iJGTXeMqPSvMgrV6qAGOU9pLCB9dQ4T1caImeS4LLr9G+plueUP1uAOgsoA7izSfnMXJs7k/q/PkQnnzIdecJRv3sQHf7LVBjpCtAYZDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IatgPgZc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IatgPgZc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2264c9d0295so37295ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745866974; x=1746471774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FYyPt2jR26wCNvi6PxzFs+Tv2/OybZasQ+Gm5GQ685c=;
        b=IatgPgZcpx9LGQO7xF0DFR9STLGpf1zp1BD1GOElpq0WBOrId31gxfAbI5zwFGeKch
         NuWo6JsH29yFGxzR3AH/UBYh2Z/sF2/D/4X5DZM2GKa/pzVv6GcbrjTwcckOAqC/Fxrn
         0235kUOh+hERRW8OUetA3YcpTn3S1YEJzQomScKiM+N7fK4wseiTTs7Rtkbam7vpmGLW
         Kc9l6RF0SDeolNajlGcauQRGN4GCtKTUa2/w13+lO/MoX5KrWoHRZk4riqCuWIaNesM1
         fbtIVSyFKn/U3l98jJ8q9GJmbFmfNqwrqMl/cmoNCeHR/wVy7IcOu52/DkE3FCyUjuUJ
         65VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745866974; x=1746471774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYyPt2jR26wCNvi6PxzFs+Tv2/OybZasQ+Gm5GQ685c=;
        b=N6R9QfzUhuJUhTB5ejJUOm0E8wPTacbLtLQUXa6xdAQG1Jk7XoCnc4ZGh5RM8oTa4L
         9wkiYIyDcFp+KGOQGuT0HB3GIxnG+9UWItysHU3mI/k1FNlVxXDDSzHojR9rb4efehH+
         mb0Eu+6u2cYdp79JEwVU1JiXz51atKu4aKr9mXjPKYbnFjHtlzIiy2FGUALaGGDb03jo
         RuamnFc//nIrReqXrwCvnkFVYoyDAy63S61vKYv4C9c0+uVyP3/Hsm2K4Ko7xN2T95Gr
         XmIH5hkw9zSZ2ls9VZgujECA4oZH0P+MJ7W52HaxVMbfg4aZyJals/qcVOAlB4BAV3/3
         VEzw==
X-Forwarded-Encrypted: i=1; AJvYcCVpbOGaGkuCkJ3LSagL1+01KJOE8lQ4ST/D6rZMP8iDt7zsBpLvCoyxhPlMCHqm4tcjTRpk6/gX6KC2lfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLi36RzgySDY7L16fiuQy4u1kvB6s+7FTk4tyIuM+9HBik0GBt
	VGh87XK/SkscZGQDBftqVE+BUzd2Z6/TSrpFUAx/4YKjbOmDxSGmfL21mPQ1MA==
X-Gm-Gg: ASbGncuAdlTuf5kihD/8r4emf1pztG999dSR9d/FNR7DC9a/eU1p+K5amnnDevpdheb
	aTG4frT67+O94GgZ6IshCvsUytpHO06/E8UzgYp3R/X2xpqBq4PrXYaYuZQqFPtldo6fWZkwJu1
	nmQAUNgQsZhgzgyjNQWhPxKeZHR4N0vtVMvYYdpcL4T1J0UX0Ng5VeK1LU7kB/TaJKcrggqsh5F
	GFZIUnvJE/gzjScwcUVM0NrBU2bcMF1zR0JjNtbZC/l3eWgzlliZr+nMRB0lWOE2ORRzqopcpx9
	twAQl0Ll7VKrMrSr9KBF18FUl7P3a3QvJNoy3uixvMQLfoQ8WmdwngIz6b0PdBH9nBHHfTHc
X-Google-Smtp-Source: AGHT+IEJGsiJDrtJlEO2nY+Xes9iIUQJtfbQGQMK+W7yiK5m4Ms2rwNKriCBn3CEAxNgqNLQt8mwbw==
X-Received: by 2002:a17:903:32cc:b0:21f:3f5c:d24c with SMTP id d9443c01a7336-22de6bc7c32mr473905ad.0.1745866973500;
        Mon, 28 Apr 2025 12:02:53 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309eef7cc58sm9392543a91.0.2025.04.28.12.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:02:52 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:02:42 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 07/22] iommufd/selftest: Add covearge for viommu data
Message-ID: <aA_Q0o74AySmRM2G@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <acb47bf56f1b03df9f6fca26f511529354be3caa.1745646960.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acb47bf56f1b03df9f6fca26f511529354be3caa.1745646960.git.nicolinc@nvidia.com>

On Fri, Apr 25, 2025 at 10:58:02PM -0700, Nicolin Chen wrote:
> Extend the existing test_cmd/err_viommu_alloc helpers to accept optional
> user data. And add a TEST_F for a loopback test.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> ---
>  tools/testing/selftests/iommu/iommufd_utils.h | 21 +++++++++-----
>  tools/testing/selftests/iommu/iommufd.c       | 29 +++++++++++++++----
>  .../selftests/iommu/iommufd_fail_nth.c        |  5 ++--
>  3 files changed, 39 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/testing/selftests/iommu/iommufd_utils.h b/tools/testing/selftests/iommu/iommufd_utils.h
> index 72f6636e5d90..a5d4cbd089ba 100644
> --- a/tools/testing/selftests/iommu/iommufd_utils.h
> +++ b/tools/testing/selftests/iommu/iommufd_utils.h
> @@ -897,7 +897,8 @@ static int _test_cmd_trigger_iopf(int fd, __u32 device_id, __u32 pasid,
>  					    pasid, fault_fd))
>  
>  static int _test_cmd_viommu_alloc(int fd, __u32 device_id, __u32 hwpt_id,
> -				  __u32 type, __u32 flags, __u32 *viommu_id)
> +				  __u32 flags, __u32 type, void *data,
> +				  __u32 data_len, __u32 *viommu_id)
>  {
>  	struct iommu_viommu_alloc cmd = {
>  		.size = sizeof(cmd),
> @@ -905,6 +906,8 @@ static int _test_cmd_viommu_alloc(int fd, __u32 device_id, __u32 hwpt_id,
>  		.type = type,
>  		.dev_id = device_id,
>  		.hwpt_id = hwpt_id,
> +		.data_uptr = (uint64_t)data,
> +		.data_len = data_len,
>  	};
>  	int ret;
>  
> @@ -916,13 +919,15 @@ static int _test_cmd_viommu_alloc(int fd, __u32 device_id, __u32 hwpt_id,
>  	return 0;
>  }
>  
> -#define test_cmd_viommu_alloc(device_id, hwpt_id, type, viommu_id)        \
> -	ASSERT_EQ(0, _test_cmd_viommu_alloc(self->fd, device_id, hwpt_id, \
> -					    type, 0, viommu_id))
> -#define test_err_viommu_alloc(_errno, device_id, hwpt_id, type, viommu_id) \
> -	EXPECT_ERRNO(_errno,                                               \
> -		     _test_cmd_viommu_alloc(self->fd, device_id, hwpt_id,  \
> -					    type, 0, viommu_id))
> +#define test_cmd_viommu_alloc(device_id, hwpt_id, type, data, data_len,      \
> +			      viommu_id)                                     \
> +	ASSERT_EQ(0, _test_cmd_viommu_alloc(self->fd, device_id, hwpt_id, 0, \
> +					    type, data, data_len, viommu_id))
> +#define test_err_viommu_alloc(_errno, device_id, hwpt_id, type, data,        \
> +			      data_len, viommu_id)                           \
> +	EXPECT_ERRNO(_errno,                                                 \
> +		     _test_cmd_viommu_alloc(self->fd, device_id, hwpt_id, 0, \
> +					    type, data, data_len, viommu_id))
>  
>  static int _test_cmd_vdevice_alloc(int fd, __u32 viommu_id, __u32 idev_id,
>  				   __u64 virt_id, __u32 *vdev_id)
> diff --git a/tools/testing/selftests/iommu/iommufd.c b/tools/testing/selftests/iommu/iommufd.c
> index 1a8e85afe9aa..8ebbb7fda02d 100644
> --- a/tools/testing/selftests/iommu/iommufd.c
> +++ b/tools/testing/selftests/iommu/iommufd.c
> @@ -2688,7 +2688,7 @@ FIXTURE_SETUP(iommufd_viommu)
>  
>  		/* Allocate a vIOMMU taking refcount of the parent hwpt */
>  		test_cmd_viommu_alloc(self->device_id, self->hwpt_id,
> -				      IOMMU_VIOMMU_TYPE_SELFTEST,
> +				      IOMMU_VIOMMU_TYPE_SELFTEST, NULL, 0,
>  				      &self->viommu_id);
>  
>  		/* Allocate a regular nested hwpt */
> @@ -2727,24 +2727,27 @@ TEST_F(iommufd_viommu, viommu_negative_tests)
>  	if (self->device_id) {
>  		/* Negative test -- invalid hwpt (hwpt_id=0) */
>  		test_err_viommu_alloc(ENOENT, device_id, 0,
> -				      IOMMU_VIOMMU_TYPE_SELFTEST, NULL);
> +				      IOMMU_VIOMMU_TYPE_SELFTEST, NULL, 0,
> +				      NULL);
>  
>  		/* Negative test -- not a nesting parent hwpt */
>  		test_cmd_hwpt_alloc(device_id, ioas_id, 0, &hwpt_id);
>  		test_err_viommu_alloc(EINVAL, device_id, hwpt_id,
> -				      IOMMU_VIOMMU_TYPE_SELFTEST, NULL);
> +				      IOMMU_VIOMMU_TYPE_SELFTEST, NULL, 0,
> +				      NULL);
>  		test_ioctl_destroy(hwpt_id);
>  
>  		/* Negative test -- unsupported viommu type */
>  		test_err_viommu_alloc(EOPNOTSUPP, device_id, self->hwpt_id,
> -				      0xdead, NULL);
> +				      0xdead, NULL, 0, NULL);
>  		EXPECT_ERRNO(EBUSY,
>  			     _test_ioctl_destroy(self->fd, self->hwpt_id));
>  		EXPECT_ERRNO(EBUSY,
>  			     _test_ioctl_destroy(self->fd, self->viommu_id));
>  	} else {
>  		test_err_viommu_alloc(ENOENT, self->device_id, self->hwpt_id,
> -				      IOMMU_VIOMMU_TYPE_SELFTEST, NULL);
> +				      IOMMU_VIOMMU_TYPE_SELFTEST, NULL, 0,
> +				      NULL);
>  	}
>  }
>  
> @@ -2791,6 +2794,20 @@ TEST_F(iommufd_viommu, viommu_alloc_nested_iopf)
>  	}
>  }
>  
> +TEST_F(iommufd_viommu, viommu_alloc_with_data)
> +{
> +	struct iommu_viommu_selftest data = {
> +		.in_data = 0xbeef,
> +	};
> +
> +	if (self->device_id) {
> +		test_cmd_viommu_alloc(self->device_id, self->hwpt_id,
> +				      IOMMU_VIOMMU_TYPE_SELFTEST, &data,
> +				      sizeof(data), &self->viommu_id);
> +		assert(data.out_data == data.in_data);
> +	}
> +}
> +
>  TEST_F(iommufd_viommu, vdevice_alloc)
>  {
>  	uint32_t viommu_id = self->viommu_id;
> @@ -3105,7 +3122,7 @@ TEST_F(iommufd_device_pasid, pasid_attach)
>  
>  	/* Allocate a regular nested hwpt based on viommu */
>  	test_cmd_viommu_alloc(self->device_id, parent_hwpt_id,
> -			      IOMMU_VIOMMU_TYPE_SELFTEST,
> +			      IOMMU_VIOMMU_TYPE_SELFTEST, NULL, 0,
>  			      &viommu_id);
>  	test_cmd_hwpt_alloc_nested(self->device_id, viommu_id,
>  				   IOMMU_HWPT_ALLOC_PASID,
> diff --git a/tools/testing/selftests/iommu/iommufd_fail_nth.c b/tools/testing/selftests/iommu/iommufd_fail_nth.c
> index e11ec4b121fc..f7ccf1822108 100644
> --- a/tools/testing/selftests/iommu/iommufd_fail_nth.c
> +++ b/tools/testing/selftests/iommu/iommufd_fail_nth.c
> @@ -688,8 +688,9 @@ TEST_FAIL_NTH(basic_fail_nth, device)
>  				 IOMMU_HWPT_DATA_NONE, 0, 0))
>  		return -1;
>  
> -	if (_test_cmd_viommu_alloc(self->fd, idev_id, hwpt_id,
> -				   IOMMU_VIOMMU_TYPE_SELFTEST, 0, &viommu_id))
> +	if (_test_cmd_viommu_alloc(self->fd, idev_id, hwpt_id, 0,
> +				   IOMMU_VIOMMU_TYPE_SELFTEST, NULL, 0,
> +				   &viommu_id))
>  		return -1;
>  
>  	if (_test_cmd_vdevice_alloc(self->fd, viommu_id, idev_id, 0, &vdev_id))
> -- 
> 2.43.0
> 
