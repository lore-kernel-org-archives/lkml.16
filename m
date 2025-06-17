Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3042F2E7168;
	Tue, 17 Jun 2025 13:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166170; cv=none; b=O8rjIiNal500XwbHZBeZOo7HiAJ0P7uSViP20qBU7YGXONt6/hFwga3oARp2TBf+VknBtWWj4O1LDkU1S1Ozm2XsQLbK0KasbvBTufwGIkhqisEzqavk1z5CC8T6zMJSsadQGiMWsfwgtZe+JPBIjkTc19ZSDPmSOzfuVoZu/1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166170; c=relaxed/simple;
	bh=9cun8hm4DoSGnNtasEwFjJD+AdzVWvo5ehIT5kRvc1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdTIgoKgRk5gvsiVJbjwA8+ftpqvCfWCfKRHVRSpLzd15mb+CZ1yeXRS9qzODSq2CzIFyASvrMVyR5DymmxHH/XsPLxGFdd1ZeOTNESFvS6oxAvnbMfU7ZLOBfjxQwRBnj7Hg7I15UvESrseUG7xAZm4F5BOEru0KLim8fQgytY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X1FnF3cG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X1FnF3cG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADC8C4CEEE;
	Tue, 17 Jun 2025 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750166169;
	bh=9cun8hm4DoSGnNtasEwFjJD+AdzVWvo5ehIT5kRvc1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1FnF3cG7xN00Z3jv1IhIBVmLNV2+EBG29+diL76dmyi6pW646s3tG1devedyKeUZ
	 ZWf0o9JgV2AUasE6/z5q9axVKeQWAPAVWkZVcyYZGvvJyTf9kpl1MxwAgyNjLARpSZ
	 FM66ffyNZd7AyNQPBt/1R3ZtrfqxlTGoBCejAXdA=
Date: Tue, 17 Jun 2025 15:16:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, vireshk@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] greybus: firmware: use strscpy, fix tag size
Message-ID: <2025061743-surging-legwarmer-b3a9@gregkh>
References: <20250617125137.24503-1-pranav.tyagi03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617125137.24503-1-pranav.tyagi03@gmail.com>

On Tue, Jun 17, 2025 at 06:21:37PM +0530, Pranav Tyagi wrote:
> Increase the size of firmware_tag arrays in the following structs from
> GB_FIRMWARE_U_TAG_MAX_SIZE to GB_FIRMWARE_U_TAG_MAX_SIZE + 1 to
> accommodate null termination:
> 	- fw_mgmt_ioc_intf_load_and_validate
> 	- fw_mgmt_ioc_get_backend_version
> 	- fw_mgmt_ioc_backend_fw_update
> 	- fw_mgmt_ioc_get_intf_version
> 
> Replace strncpy() with strscpy() to ensure proper null termination as
> firmware_tag is interpreted as a null-terminated string
> and printed with %s.
> 
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  .../greybus/Documentation/firmware/firmware.c        | 12 ++++++------
>  drivers/staging/greybus/greybus_firmware.h           |  8 ++++----
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
> index 765d69faa9cc..3b4061f4b34a 100644
> --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
> +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
> @@ -63,8 +63,8 @@ static int update_intf_firmware(int fd)
>  	intf_load.major = 0;
>  	intf_load.minor = 0;
>  
> -	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
> -		GB_FIRMWARE_U_TAG_MAX_SIZE);
> +	strscpy((char *)&intf_load.firmware_tag, firmware_tag,
> +		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
>  
>  	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
>  	if (ret < 0) {
> @@ -101,8 +101,8 @@ static int update_backend_firmware(int fd)
>  	/* Get Backend Firmware Version */
>  	printf("Getting Backend Firmware Version\n");
>  
> -	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
> -		GB_FIRMWARE_U_TAG_MAX_SIZE);
> +	strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
> +		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
>  
>  retry_fw_version:
>  	ret = ioctl(fd, FW_MGMT_IOC_GET_BACKEND_FW, &backend_fw_info);
> @@ -129,8 +129,8 @@ static int update_backend_firmware(int fd)
>  	/* Try Backend Firmware Update over Unipro */
>  	printf("Updating Backend Firmware\n");
>  
> -	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
> -		GB_FIRMWARE_U_TAG_MAX_SIZE);
> +	strscpy((char *)&backend_update.firmware_tag, firmware_tag,
> +		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
>  
>  retry_fw_update:
>  	backend_update.status = 0;
> diff --git a/drivers/staging/greybus/greybus_firmware.h b/drivers/staging/greybus/greybus_firmware.h
> index b6042a82ada4..ad5b2c8a6461 100644
> --- a/drivers/staging/greybus/greybus_firmware.h
> +++ b/drivers/staging/greybus/greybus_firmware.h
> @@ -38,20 +38,20 @@
>  
>  /* IOCTL support */
>  struct fw_mgmt_ioc_get_intf_version {
> -	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
> +	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
>  	__u16 major;
>  	__u16 minor;
>  } __packed;
>  
>  struct fw_mgmt_ioc_get_backend_version {
> -	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
> +	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
>  	__u16 major;
>  	__u16 minor;
>  	__u8 status;
>  } __packed;
>  
>  struct fw_mgmt_ioc_intf_load_and_validate {
> -	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
> +	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
>  	__u8 load_method;
>  	__u8 status;
>  	__u16 major;
> @@ -59,7 +59,7 @@ struct fw_mgmt_ioc_intf_load_and_validate {
>  } __packed;
>  
>  struct fw_mgmt_ioc_backend_fw_update {
> -	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
> +	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
>  	__u8 status;
>  } __packed;
>  

You are changing the size of a userspace structure here, are you SURE
this is allowed?

How was this tested?

thanks,

greg k-h
