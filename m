Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F222E62C9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743758182; cv=none; b=Ax3oo6M6U2xnc6uuOw8AWHFMLlBMsuHZTMl3H9lwfayHmKY3G0srH27eQVuEx4p/3otVWnhgm5aw7qmACCcL0TxtHWg6zUpVhtdY1uV9fLtsS2wxFSijccR7MUiUeuMhXuVuR2mthE9oENMxvlpKjm6DIn0Bq8ziv6W5HpOxWmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743758182; c=relaxed/simple;
	bh=5b7zWglJW2pQRpF/VAvCbkmMxN1dErHIcKD7M1KuYb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJeLbu3A41Mk8edlFr8Qp3SXEiCD3KUkPd/aeSQ9HmD3nB5S14Emi02rGMApc7hA9bF78Y6lKJpPwnyh0Zb2ek8q/kFC3KWn9ZQeFfUgEJOve1WLdSQbQl1/jMAJAbylwUiaHJy0p0glVxzT+Lhhr/PT8kIzgxIRtTHQMJ/N9jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Zv3pX7Vm; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Zv3pX7Vm"
Message-ID: <98d40957-1b82-3131-7aea-6c8fe82724e3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743758167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7eHxMIsBaZbX7wX9Z20E8DWlcz5DkoLsuwp84tWvw18=;
	b=Zv3pX7Vmd55TpZ0I34bF0Q8Ov+Ee2Y25E7q+0iJtzxvSEiTB4ko0uf2K9MzxTVIwT1DYBP
	WxNlNo+RDOxhbn5b39tQBrmHBGuuSdSBfDO7Nj1WUi9xep94JsgAKMzU6QXtrKeXMWzcNZ
	GTDElZSnvO8uNsaIfIEL65fawJuIVYk=
Date: Fri, 4 Apr 2025 17:15:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] staging: gpib: warning: variable 'nec_priv' set but not
 used warning
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, dpenkler@gmail.com, arnd@arndb.de,
 everestkc@everestkc.com.np, niharchaithanya@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>
References: <20250321010649.10918-1-sunliming@linux.dev>
 <2025040310-poncho-armband-782a@gregkh>
 <8e92451a-4d43-1836-ce5f-afb6a523115b@linux.dev>
 <f6e2c865-7c9f-4301-a1a8-8a5b1dbbb5f4@stanley.mountain>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: sunliming <sunliming@linux.dev>
In-Reply-To: <f6e2c865-7c9f-4301-a1a8-8a5b1dbbb5f4@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 2025/4/4 15:53, Dan Carpenter wrote:
> On Fri, Apr 04, 2025 at 02:08:38PM +0800, Sunliming wrote:
>> On 2025/4/3 22:08, Greg KH wrote:
>>> On Fri, Mar 21, 2025 at 09:06:49AM +0800, sunliming@linux.dev wrote:
>>>> From: sunliming <sunliming@kylinos.cn>
>>>>
>>>> Fix below kernel warning:
>>>> drivers/staging/gpib/eastwood/fluke_gpib.c:196:23: warning: variable 'nec_priv' set but not
>>>> used [-Wunused-but-set-variable]
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Please link to where this was reported.  The report from the robot will
>>> have the needed information in it on how to do this.
>> Get it, I will resend the patch to fix this.
>>
>> Thanks.
>>
>>>> Signed-off-by: sunliming <sunliming@kylinos.cn>
>>> As per our documentation, please use your name, not your email alias, on
>>> the signed-off-by line.
>> It's not my email alias,my name is sunliming too.
> Why is it capitalized on your From header on your email but not in your
> Signed-off-by?

I didn't notice that my email and Gitconfig have different names set.  
Thank you

  for letting me know, I will fix it.

>
> regards,
> dan carpenter
>
