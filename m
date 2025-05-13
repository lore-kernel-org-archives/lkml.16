Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704D21C68F;
	Tue, 13 May 2025 19:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165538; cv=none; b=BdBo4IphgTouDiuikS7nz63Jr4UuZG/Vnqnfu1XVMa3wUuO0NX4akJJqzYGwLVRZi/HahE0bAdpR3UZFeEs7ipqC4y+ZuvQ0Qp+3wgAr4aXtvgsTq20f3um8is1VceofHEPbXCap8P2fhcP8ltm1RfDGq1S8W6yUj3G6k3//GHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165538; c=relaxed/simple;
	bh=lBNW4zBEM/j0MNmjok1bPUGiuM3R19Ura4s/36Eu2xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JWK23yD1eyH8rRh4zEx9Ol4IbKGoR4N3vZhN0KnCwXNCSwd7k0AGWlPUzD8yKa/D2d3dFgwuvsG9Dc3YUrnzThAZ4o7YNqEg9cPSEQgSJDbAMrP+ahIxdWDJMGQp4lpO3JJNDAPa6jxqkbWXAlLLhFxoJoAvD+8K+qs0D6aSMtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=e0i0fjmv; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="e0i0fjmv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747165512; x=1747770312; i=w_armin@gmx.de;
	bh=lBNW4zBEM/j0MNmjok1bPUGiuM3R19Ura4s/36Eu2xg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=e0i0fjmv34Udj2xdPZzLuiK3+kjCjkLOsNM4PM45QALG2PnavBuczwngIL2p+QE7
	 56s0PytMXE3tV5CNo1VQNvYXKtlMNtS2Bvh+X6fJAlE/b0FSwo+jFPFaRjYGTCktC
	 j3Xm1yGXV8ozIfAX+IcmlhL0/6hAXRfU792guplynRCuW3ao1xuse1zFjXFU/T+zR
	 NAScHq+knnF8ryskpcGL3ANh5cdjlpsZWL49g3XhFjyKLq8MlUF1dFd76BF6WF9uL
	 YVYDxJ9fE4hnuaAo8LlkEgyFhQsWoo0mbl4429w0wnMAMaXDc59jVuGD48ZPvF/d0
	 D9zCfYkLz9izC+H/8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McpJg-1unRMj1yN8-00ZOIG; Tue, 13
 May 2025 21:45:11 +0200
Message-ID: <e69097c9-b9f4-456e-ad38-955a5511c414@gmx.de>
Date: Tue, 13 May 2025 21:45:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/10] platform/x86: msi-wmi-platform: Add unlocked
 msi_wmi_platform_query
To: Kurt Borja <kuurtb@gmail.com>, Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-3-lkml@antheas.dev>
 <D9UFCPLQHE5V.UH1BAK279S5M@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <D9UFCPLQHE5V.UH1BAK279S5M@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:pi1mn3z5OJXqF8HqmChRnn5Ha1H32diW21bOPLkxrBDPPE2O1e1
 MWhEqWuA0mTCSHbnUjH+8G5wD+WXXpfh3CM5OUEwYKhsOsx/AAFA50Q1/dRm4p9f0aCb1nd
 6RY7PZZdOqF/L70LYmxp+b/gOIu/NlPKnwXqDtspNzwfir11wICYdOqGS+it6B1cE5CyiDT
 4O3gOQsz9CBsyoW1W87lA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nKRyWvidPKQ=;XNaDZ9xV0MDeADKPKuTnVPHR7Y+
 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

Am 12.05.25 um 21:21 schrieb Kurt Borja:

> On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
>> This driver requires to be able to handle transactions that perform
>> multiple WMI actions at a time. Therefore, it needs to be able to
>> lock the wmi_lock mutex for multiple operations.
>>
>> Add msi_wmi_platform_query_unlocked() to allow the caller to
>> perform the WMI query without locking the wmi_lock mutex, by
>> renaming the existing function and adding a new one that only
>> locks the mutex.
>>
>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> You only use msi_wmi_platform_query_unlocked() to protect the
> fan_curve/AP state right?
>
> If that's the case I think we don't need it. AFAIK sysfs reads/writes
> are already synchronized/locked, and as I mentioned in Patch 10, I don't
> think you need this variant in probe/remove either.
>
> I'd like to hear more opinions on this though.
>
The reason why we want such a function is that sometimes we need to perform
read-modify-write operations over the WMI interface, forcing us to prevent
other clients from calling a WMI method.

Thanks,
Armin Wolf

