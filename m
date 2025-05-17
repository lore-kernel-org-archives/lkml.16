Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10313210F6A;
	Sat, 17 May 2025 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747504704; cv=none; b=B/1iz9GDSQq4K4mRts9gjIonBtQAMqopMuivFWU6gx7vyKmrfJveR1UBFW0uTd5S8hdlUhNfWXKa0aR5JudsDP/m6W5D6kaYiJADtKr9+Hvsz04AKkdMHzNI6SyX7RdMDO4rDWw9Uxnx9txlf71t3/9uktffYmLmx6ECjyLHiKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747504704; c=relaxed/simple;
	bh=8uIhR/KyHdfLSojK4k7dgRXDjwpMKUL2XsWl805nF2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z68zwC+qGGerFWhvAXVI/u4u8dPb2wg4FW7Ooy03baX3yMr6SZiFhlqM71e82nnIx4aGbKCLCzBzldaqyceMLAnTMiKJG2ZrZ+DHkGQ/HRhgjSCtw24sVHTJCDnjx0Fi3twEQ34tLogkMYhSV9YiRR6r3Zl0gMgrSqlDlE7C+HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hbYivCU4; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hbYivCU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747504697; x=1748109497; i=w_armin@gmx.de;
	bh=9l+wVAwq2VuiVyQDU9YFVLMBKcErE18ryZ+Rer0EUB8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hbYivCU4llYdlmdEwY2TARUD3GYDxggqiggZYDKT96cegYYgy1OswWe2X/s2R/o1
	 w6Ou2VQEo6HhpwbTzXOVJbkGaRvDimdxEUdIfApo3FuNEoucmW3MEinoG5/HXTmnA
	 oZqQbse+ujS6u/ttAxqaYHAjnGWs+++IDEqrDqGX+SQhuuLXagp1jRzXxOpsIIFNE
	 mJCfZ6cq4dLPcghP7wUs1IUsSCNAZnRcINYg0hR9u/c/bjXwJnhEV5SpOaqSpCibx
	 iotddOKwEm4/tmy899zE/5Q1EHR+zBXXU/BwgwYB3WidGAWyLtMH1CSPqm5F26J17
	 3cFxp0hxpLStoSQ78g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4z6k-1uzGwO3BzA-011TMi; Sat, 17
 May 2025 19:58:16 +0200
Message-ID: <96792b63-5a69-4716-af1e-47dabe8aae82@gmx.de>
Date: Sat, 17 May 2025 19:58:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ABI: Fix "aassociated" to "associated"
To: Sumanth Gavini <sumanth.gavini@yahoo.com>, skhan@linuxfoundation.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250517175626.1363502-1-sumanth.gavini.ref@yahoo.com>
 <20250517175626.1363502-1-sumanth.gavini@yahoo.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250517175626.1363502-1-sumanth.gavini@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:dmYZiQbcYvohvZY6BuXmTRR1YliUZx07mdh016+FkT8a83HuLjT
 wps8ZkJljtafQcWWP/cxv3gwBVF3EDgRummK0uBq4QNj3D1Kgv00YlXvSeWk80PPOCCcOjA
 04iwN4X0ZDXk8Bm0XJWg39NJcHdfHgSN3XOnGobjH/1lJIz+Grvry8tcVbjTdAy9x0u8MKU
 RfqfRcc+c8HR94HSEVlkg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sSap5e5pFN4=;jHeWMZZrDqFfptFnu4QAJaHI5uS
 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
 g==

Am 17.05.25 um 19:56 schrieb Sumanth Gavini:

> Fix misspelling reported by codespell

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Sumanth Gavini <sumanth.gavini@yahoo.com>
> ---
>   Documentation/ABI/testing/sysfs-bus-wmi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-wmi b/Documentation/ABI/testing/sysfs-bus-wmi
> index aadb35b82198..d71a219c610e 100644
> --- a/Documentation/ABI/testing/sysfs-bus-wmi
> +++ b/Documentation/ABI/testing/sysfs-bus-wmi
> @@ -76,6 +76,6 @@ Date:		May 2017
>   Contact:	Darren Hart (VMware) <dvhart@infradead.org>
>   Description:
>   		This file contains a boolean flags signaling the data block
> -		aassociated with the given WMI device is writable. If the
> +		associated with the given WMI device is writable. If the
>   		given WMI device is not associated with a data block, then
>   		this file will not exist.
