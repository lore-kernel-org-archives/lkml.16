Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E9F28F5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322066; cv=none; b=o9Q+TC2CPANs/nAiX5Xr9QCOF+MazUTqh0brK83a9LuVsn9H+5lCkxzf4d7WPVKhFMpLKoSBTlZDXhX5kKnfy9KbwF+XH0vB3YDHfwvcVeJOxxgU+KC5VZKxasqKcF+HbellDFkbOrLpNM18Z7EINv7FILzrB90yvxTPfp9qNMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322066; c=relaxed/simple;
	bh=sErKUu8XaQGTuZYPaxa47iJFKeitfE1I7A8JZ8iHBI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hiA0cKPK1EfKDmpIaZy6z2BD2eDJcaC8rWDXX9Ep1lru/HsSZsdoS0BJS+pZpNGoes/aKL9i2e8m1q2zt0wXV/UZFf6n0izS6PgB3ZeZwSpI2y9IU2WbpBe3FfDi/LatBoWavSJpnHA8eIKY7cAxIUxdGMPW4SRWc0Xx/6Zu3BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=VFFsBcyU; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="VFFsBcyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1745321752;
	bh=sErKUu8XaQGTuZYPaxa47iJFKeitfE1I7A8JZ8iHBI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VFFsBcyU63fPkCCrr1II0Ugnbp1n/w9AVI/GwUvUlStpjbpxlw1y8ujRlzVu+dXlT
	 iK2FmnVzOWLvkXTLI3hq4f6ttp/wNefD/iacJTRvMYymGDc+0c6efSUL7sTYnojW00
	 tJq8Zqu4zarY9eOlr5sapTnB/MoKtbs2vUzsw+VM=
Received: from [10.42.13.56] ([116.128.244.169])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 8F232494; Tue, 22 Apr 2025 19:35:50 +0800
X-QQ-mid: xmsmtpt1745321750tbwfjzkn9
Message-ID: <tencent_99252291FB8F0A1F32CF2BFFE46BCEC33505@qq.com>
X-QQ-XMAILINFO: MFdGPHhuqhNochkLj6pIz0hNRT4T/zP+3wO9C3a7eKaUKVMcwxP0PnAnkZRJAo
	 6UikYtOjlYJXzR317zFk7xFJjK50wefaHA/HwQ1i1FQUO1SbebI5fqzKz9P8BwcyvIfVGIm5Ym8I
	 KUlEiaOA6feKaNc4zFkBI7+dIbitCHH5lntWbuurtdCtBf0q5pmjeDgsw8an8PSzKEOxSmyVK0tH
	 px7F6y37JgWR53PNcN5jIhaCRZyqxxOxFi88zbR6I8K4G0Or22l6obUzPCa/WF+i2rSSSLnozWKT
	 IOU3hnqFjNIMYP5IRAxWbRcfG4nNidTRx+a+oPiAh6SHSPxNnDymzp6oJmScpYTUTaaBmXRHyaP2
	 d1KrjXz927m+zdzSttu2BLCqdJG/1dXXofpplD3ZuwdefZaJrdtpQaIQ895zg6fAh8ZG7ErbJc+G
	 D3G0h4o+hq1Kykr9VHKFfIC4EFEaBHyc8jmD2Dp4iC86zVha9PjAEoZF/cXZNyDSmXbetFD7TIzD
	 2zleWKPvB3j4bu3swLKBlFIBloi+IQMqesb/oDdwpSNL8m8aweBQTsBnYNLAf1W8xIraiOsgNHAH
	 Zh4WWBOmJIoNnGh8PCVACoWn0JNaljKykzLs/CI50vUneNvvOrgRmxrtqMv+KdfnAr4SF8V2WF19
	 wUV5agm3BU7MgaAtLqqXnm9QkIL0VZGaxupQ3pZLlId394mSaOkNbkeywupFkgQQJyghDu1iLBbN
	 aSB0M+2WOwlRxX1fDCYCKbXzGPoOZB+h7QAdIgou5veZKyO0Z9zZtIbVvNdqnHvyubuOj5OGUcFA
	 AymIgACb3A33Cu5AzsOl7/GhwOOaOgWjdw5qGFVx49gsDNcM6ghMsjoo0leNnh+rezVouGG6csGp
	 W8CvejB/ADd4ndos80y71icLShL/wC20c83cdjELk6GSXZ17Hz85sywKvCv7osfM4ARscn/4iUWz
	 MAdhKH5/nlGtxSRfv4mCrGndSUtP+OBiC3yFdSj/6VHgG6pFrH9e3jO+ue0VqEhCmEXz0o6rU=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-OQ-MSGID: <5b365ebe-0581-4aca-b8e9-cd26ba76aa2b@foxmail.com>
Date: Tue, 22 Apr 2025 19:35:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] bus: hisi_lpc: remove unused head file in hisi_lpc.c
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, f.fangjian@huawei.com, robh@kernel.org,
 john.g.garry@oracle.com, xuwei5@hisilicon.com,
 Pei Xiao <xiaopei01@kylinos.cn>
References: <cover.1744964101.git.xiaopei01@kylinos.cn>
 <tencent_8024B8D7E209E31C8E2B5AC411B70C551106@qq.com>
 <aAO_mIY99CMH4o8d@smile.fi.intel.com>
 <tencent_DB84706B5135401678FD9E84CC6DB8C2450A@qq.com>
 <aAdMNb8n_wr5PwyQ@smile.fi.intel.com>
From: Pei Xiao <xiaopeitux@foxmail.com>
In-Reply-To: <aAdMNb8n_wr5PwyQ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


在 2025/4/22 15:58, Andy Shevchenko 写道:
> On Mon, Apr 21, 2025 at 10:06:28AM +0800, Pei Xiao wrote:
>> 在 2025/4/19 23:22, Andy Shevchenko 写道:
>>> On Fri, Apr 18, 2025 at 04:51:23PM +0800, xiaopeitux@foxmail.com wrote:
> ...
>
>>>> linux/console.h,linux/io.h,linux/pci.h,linux/slab.h
>>>> are not used, this patch removes it.
>>> Definitely you haven't tested this...
>> Sorry for that,I have tested in ARM64 platform, have no build problem,sorry for that!
> Okay, but you need to follow IWYU principle. io.h is definitely used in this
> file.

I send v2 patch in:
https://lore.kernel.org/lkml/tencent_AB44A8723B522941A2792D9C58CDD9B8B60A@qq.com/

but I don't that comment patch whether have problem.

thanks !

Pei.

