Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEBD236A90
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917452; cv=none; b=B8S3il4Y14VJ4851BlNQkpvavglf7GTi5/cdSJGTpW0wJ4ucc14OlAqhshwvLsqGjOp4i+rY6JWrbTnPR68+x7O7GYcpzMagCXhHbkKDf7Y/QGqNOW/aFtBiRe0jgD0kNwqDfBbFdRQeLUcTvLu0hxE/iCZbeStHqyfydtnq2Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917452; c=relaxed/simple;
	bh=JG/JfQ6Ey33pIAzxKhXFXOl44LIAvMi9PQm6hnox7Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hx7/cDxk9r4lIr1KzEjRHNCtxm0M0XXkK2yf66jkGqVntMthCqR8pjpvBmqBI6ufn5srAFwYDxYpF+FErTdRKcYmXaxD+j2Q58RTTTLYv2Kn2umjxuJthJHCKESGq7MQzSRHhkkANE3e4Am1DFyBLqW0m6CKderGN/TvUfYIh2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hdIb4+HL; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hdIb4+HL"
Message-ID: <fb3c5ec4-eabc-48c0-bf0b-d20cad978b4f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738917433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xOcHUCtKAqBWxKDTM/pms9igA0mTe68HyzY0zMevu1I=;
	b=hdIb4+HLWbZxDsR+1Ci38PrPgwaPvOq9Bd7uQeYYcr5tFHNQgnhv5oQ0u2spMAKwJopTNy
	Gk+7LK9IXBKebYyXMtlFeB72SDMDw7wKH7zNWQQEcpQ8odu/61CMrkxrCUTkjemEEMfnUD
	4hrc1tQPh/ETbcTjT45JX54+E+BKdX8=
Date: Fri, 7 Feb 2025 16:37:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] docs/zh_CN: Update the translation of dev-tools/ubsan
 to v6.14-rc1
To: WangYuli <wangyuli@uniontech.com>, alexs@kernel.org, corbet@lwn.net,
 dzm91@hust.edu.cn
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 horms@kernel.org, zhanjun@uniontech.com, guanwentao@uniontech.com,
 chenlinxuan@uniontech.com
References: <EE89209B6353C426+20250207031812.15023-1-wangyuli@uniontech.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <EE89209B6353C426+20250207031812.15023-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2/7/25 11:18 AM, WangYuli 写道:
> Commit 918327e9b7ff ("ubsan: Remove CONFIG_UBSAN_SANITIZE_ALL")
> removed the CONFIG_UBSAN_SANITIZE_ALL configuration option. Update
> the Chinese documentation accordingly and revise the document format
> by the way.
>
> Link: https://lore.kernel.org/all/6F05157E5E157493+20250123043258.149643-1-wangyuli@uniontech.com/
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
> Changelog:
>   *v1->v2: Update commit title to v6.14-rc1 and add Dongliang Mu's Chinese name.
> ---
>   .../translations/zh_CN/dev-tools/ubsan.rst    | 35 +++++++++----------
>   1 file changed, 17 insertions(+), 18 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/dev-tools/ubsan.rst b/Documentation/translations/zh_CN/dev-tools/ubsan.rst
> index 2487696b3772..a4d4d4c6d157 100644
> --- a/Documentation/translations/zh_CN/dev-tools/ubsan.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/ubsan.rst
> @@ -3,7 +3,16 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
>   :Original: Documentation/dev-tools/ubsan.rst
> -:Translator: Dongliang Mu <dzm91@hust.edu.cn>
> +
> +:翻译:
> +
> + 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
> +
> +:校译:
> +
> + 王昱力 WangYuli <wangyuli@uniontech.com>
> +

> +.. _cn_ubsan:
we don't need the tag.
>   
>   未定义行为消毒剂 - UBSAN
>   ====================================
> @@ -55,30 +64,20 @@ GCC自4.9.x [1_] （详见 ``-fsanitize=undefined`` 选项及其子选项）版
>   
>   使用如下内核配置启用UBSAN::
>   
> -	CONFIG_UBSAN=y
> -
> -使用如下内核配置检查整个内核::
> -

> -        CONFIG_UBSAN_SANITIZE_ALL=y
> +  CONFIG_UBSAN=y

Please keep the indentation length consistent with the original one.

Thanks,

Yanteng

