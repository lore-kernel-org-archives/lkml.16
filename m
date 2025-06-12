Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA152BE7D7;
	Thu, 12 Jun 2025 20:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749761827; cv=none; b=PuYTNyZXaZeQ5xwRNaB0QWMnxLjbSwQFawEifqHgXoxeHSJNQdB4NCbniU/qOhqt5bX65Ie2rCke57vtjC/c6L+BQFI6U95Gcvn6WlMx8ZAWIAGzHHn6Ebv3V4AfJJXJJCumw8C2cCMEVSoSMAyQpqo/3Zo8sH51hW6lzPb+L7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749761827; c=relaxed/simple;
	bh=kAl3X4icEH5G4v1NzozyHJMjAuQKgTZctpyS+kOvNY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qH90YGs0SKS2KzAwMkGMY3XGO1xy9UxmbgshDJIELCN0/M3lVUOeKprkCbYokbmelHVQmVLhE2LVMIVWhumiQc+4znRousQSFtJJ/qSw01JThuxiGyAQ8hyf7EyuYoWwYWfxKpdkKfHHAYFmzAW9nPFIbly929LARe4a9Jb+rYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGlSL/Q1; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGlSL/Q1"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b2fd091f826so1116092a12.1;
        Thu, 12 Jun 2025 13:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749761825; x=1750366625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SO25S69Dc2ZBc+IW2rDjwj7tPPckqcvCvVz6zrWP9r8=;
        b=EGlSL/Q1C9lAaa1VH29agydaq8CG2AJnxZrQIbyLDhkOTGT+bofknQ3ud3fbk2B7Qr
         GOWu5Qg+fcVY+nKPh2DtyqUDp1RhxEjpf3viYAZWjXiWfJQ8k4B41v5bLShKRIB0iXyo
         VQw2Wmy31trR9J3QelF2rlMoAkGWBjS5TUrxJf+YY+xcNmKwibAxEqojzhLBz0ZzS6m/
         p0wqhGVh4zGh74KNtORMEPmsaY4cdWqJ2JsjF/4dv3ILboqQ3W3HIxtFpzozp9K4oNzT
         JutRWZNslhaZFRn8RxfIlClAN5AuWewxI4xmn80NM/FGuJKYecstltbH66pjSVx6tztM
         A3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749761825; x=1750366625;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SO25S69Dc2ZBc+IW2rDjwj7tPPckqcvCvVz6zrWP9r8=;
        b=k/4kkWKU/kPhb9eaST8al0/+fXnl1RngEn0I/dLNX0eag8CCyC79IBQHbqp/D4JANZ
         vWw5HdgGiLtw61h28j8I8w/GPbLoS2BLyYGJyYqM4EzriaTLM03ovErMnHLSMXT+klc+
         zuLwhoavbM1rgMEonpeTgPjZXFwBrbTJWIefR4uEGUV6DdED74vqQ0/H5pKUmhxARmcx
         ill2dvaxcRkum5ZIb7g74fl+9ebzJ0/gupUEmuU+VIhdlF54vRroxLrD68lbfeV6Ox4b
         nzsWlCEwY5dHJmakVpsar98xcrDpibYvBRbM4E2GUedYFEvfkL4hezaiTtrQQ3WpmrzZ
         mjQA==
X-Forwarded-Encrypted: i=1; AJvYcCULnEq1XgJS5t/Y5H6Wh/M8gejhcWmnwRMu/M8cBh/I/fpUCU87h9KxwZ2EO7KuXRQQbiPIZx2AZ/s/hxEq@vger.kernel.org, AJvYcCWYFhIeRhdkEaQjMtKntj6UMZmu/cpsWiOyDxIAqCQlcThN799m8bP6LizNbZDjsHZOQCEJiKH9Ji0qcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YznZ0TduvrjhPRj5cunEBWWHMCq0mw98xgGlA/goid9EKy5jVMD
	M81xdCUFAHq47f6BlBk8aQP7Q8yvadwVIOHEc1KBPCyeYDpGCgfLRpcs
X-Gm-Gg: ASbGncuBhEv5HvTh/sRfE7e7hxINosZiYuf5AGYoERpuOuUsT6Z0SWiwm249uQ3/XXq
	GuGaTWSRFj4v23LCoqQsz3yo3wt/z4G/h3SIs5AYkvE0OSWK3yfClyk4FLF9X7Upsm/XSfeACQ0
	iv2CqFGRtUiCUgcoYSCx8iwlNVd3WO2gIiUsDq9iPmWG3WqjpheS8qXg2Fqc/RbZMmFWM6WQgBM
	PkIV62FsX2HUaHgBA5R3DgAFjDnzhxjjvs0ymjW4M0nDlhed157KYsT8NxeLs7YYHoUVXESK4d2
	yXf6kKtPHk5jwDDVgEOtTkrT+ksQJJ41NscFKL5bCVY7MIbweaMekR63RTe/l0/8kH4giJwMT0q
	t5G2M8DAqcwGsSLyFThbK7ZZytjSTtDois6w=
X-Google-Smtp-Source: AGHT+IG1CLr1UQc+7vAWzJP2B6z34wP4geJYT455p72hMk1PVCxCMq69xuMkl5bn1nIl1Lua1u6JJQ==
X-Received: by 2002:a17:90b:2c8d:b0:313:17d0:b066 with SMTP id 98e67ed59e1d1-313dc2344d4mr19655a91.7.1749761824543;
        Thu, 12 Jun 2025 13:57:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bdb39bsm1955186a91.20.2025.06.12.13.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 13:57:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <62bca511-8cc2-4d26-96e2-bb35c96dce72@roeck-us.net>
Date: Thu, 12 Jun 2025 13:57:02 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: ibmaem: match return type of
 wait_for_completion_timeout
To: Qiushi Wu <qiushi@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org, zohar@linux.ibm.com,
 qiushi.wu@ibm.com
References: <20250612184324.1355854-1-qiushi@linux.ibm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250612184324.1355854-1-qiushi@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 11:43, Qiushi Wu wrote:
> Return type of wait_for_completion_timeout is unsigned long not int.
> Check its return value inline instead of introducing a throw-away
> variable.
> 
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Signed-off-by: Qiushi Wu <qiushi@linux.ibm.com>
> ---
>   drivers/hwmon/ibmaem.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
> index 157e232aace0..e52e937a396c 100644
> --- a/drivers/hwmon/ibmaem.c
> +++ b/drivers/hwmon/ibmaem.c
> @@ -383,8 +383,7 @@ static int aem_read_sensor(struct aem_data *data, u8 elt, u8 reg,
>   
>   	aem_send_message(ipmi);
>   
> -	res = wait_for_completion_timeout(&ipmi->read_complete, IPMI_TIMEOUT);
> -	if (!res) {
> +	if (!wait_for_completion_timeout(&ipmi->read_complete, IPMI_TIMEOUT)) {
>   		res = -ETIMEDOUT;
>   		goto out;

If you want to clean up the code:

		return -ETIMEDOUT;

Also drop the second goto and return directly, drop res and the out: label
entirely, and return 0; at the end. That goto is really pointless.

Guenter

>   	}
> @@ -491,7 +490,6 @@ static void aem_delete(struct aem_data *data)
>   /* Retrieve version and module handle for an AEM1 instance */
>   static int aem_find_aem1_count(struct aem_ipmi_data *data)
>   {
> -	int res;
>   	struct aem_find_firmware_req	ff_req;
>   	struct aem_find_firmware_resp	ff_resp;
>   
> @@ -508,8 +506,7 @@ static int aem_find_aem1_count(struct aem_ipmi_data *data)
>   
>   	aem_send_message(data);
>   
> -	res = wait_for_completion_timeout(&data->read_complete, IPMI_TIMEOUT);
> -	if (!res)
> +	if (!wait_for_completion_timeout(&data->read_complete, IPMI_TIMEOUT))
>   		return -ETIMEDOUT;
>   
>   	if (data->rx_result || data->rx_msg_len != sizeof(ff_resp) ||
> @@ -632,7 +629,6 @@ static int aem_find_aem2(struct aem_ipmi_data *data,
>   			    struct aem_find_instance_resp *fi_resp,
>   			    int instance_num)
>   {
> -	int res;
>   	struct aem_find_instance_req fi_req;
>   
>   	fi_req.id = system_x_id;
> @@ -648,8 +644,7 @@ static int aem_find_aem2(struct aem_ipmi_data *data,
>   
>   	aem_send_message(data);
>   
> -	res = wait_for_completion_timeout(&data->read_complete, IPMI_TIMEOUT);
> -	if (!res)
> +	if (!wait_for_completion_timeout(&data->read_complete, IPMI_TIMEOUT))
>   		return -ETIMEDOUT;
>   
>   	if (data->rx_result || data->rx_msg_len != sizeof(*fi_resp) ||

