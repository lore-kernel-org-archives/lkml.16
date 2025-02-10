Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FB318E764
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739174611; cv=none; b=r7Dwfb/rAUtlq7qHD4ufjngy8BbCWsjaiE2wDHrK2zYphtpEwTeJ+0AY7C+OL0X3cw6r5ONrnxhL03ttTrEJILYpXvcZg2qvthKBWl0fAlRXiWn8IV8PPfY7I9Jr6QPLvNKR1Iw9EXTWTBs1ogdNvWJbcP2Sz8oAHrha/V+8IB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739174611; c=relaxed/simple;
	bh=Dg1kCudP1IjSLmc8KnU1aRmbuvz6Cz6N5MYzA16l7Io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWb+VbdJ0tJxNnmEwS2C7ZnmGzIQxb2AHItBaPdWM5lrUv4Qdk/XySZnL7dlWORTfd6NQMxqaccEAMMiZVaY6fMaSuuCGunLZckTO3vHlg7cTm4j+IlL1B58YKXcLtR73LQNiY+XVgf+M/QjYorMXa2gKmFtz2oMQov0q1q3fqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b=cXTEBZRY; arc=none smtp.client-ip=62.149.156.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b="cXTEBZRY"
Received: from [192.168.1.58] ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id hOiHtVXrsyJfShOiHtFZF5; Mon, 10 Feb 2025 09:00:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1739174418; bh=Dg1kCudP1IjSLmc8KnU1aRmbuvz6Cz6N5MYzA16l7Io=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=cXTEBZRYRIgbDpSfgMF9X3SDSk+r35Jn9iYBQryizE6sDL6gm19hPe3VWEGtKFqyg
	 CTglwEclckMqIDZB/Z9GYnp7/hYsVya+a3XLaezS/0kzNDTta2oQgcchLktFc4uFoO
	 N01AMoPk4wpqQzztuvGsfkJrmsRb0WhKogOt8AHVAftXU1NKFuayD0JKDpep47UAkV
	 S3aj1F174XERkDFRbQCKcZHfxIKN/8egDDDcurrFD7TQxU1YpkNsEnHAa1PTp/EZze
	 gInlQ0uIUEXvcKIO3m1FSDdHgN4x9pQzPcALeVncVj4p8nRf2H+NLaOXycTnUENiw4
	 J/tP2YgOTDNkQ==
Message-ID: <73539b96-fc89-48f3-81e7-53af0066bc22@enneenne.com>
Date: Mon, 10 Feb 2025 09:00:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/4] drivers pps/generators: replace copy of pps-gen
 info struct with const pointer
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 subramanian.mohan@intel.com
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 gregkh@linuxfoundation.org, tglx@linutronix.de, corbet@lwn.net,
 eddie.dong@intel.com, christopher.s.hall@intel.com, pandith.n@intel.com,
 thejesh.reddy.t.r@intel.com, david.zage@intel.com,
 srinivasan.chinnadurai@intel.com
References: <20250210050421.29256-1-subramanian.mohan@intel.com>
 <20250210050421.29256-2-subramanian.mohan@intel.com>
 <Z6mXC7loE3qRYpUQ@smile.fi.intel.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <Z6mXC7loE3qRYpUQ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfC4rXCr1LhxB1nQfIqMN3O2IbnbRuM7aHl4pBKCVlSfOu+RbqeZ0PjtKbSBf/m5lCIWpv1zzFF0cAj8rsMrrtg0zRC/BiArAb8XO/slHN1tAnLBpYZNR
 5JmRp1p1Ev3Q6yApRtYMLJZx7CRNN2I61XpFyJ4dpBdwSP4GmJHzD7ESBWCXmz2/5KP7iMA+DW5sH70KkXinuBgCrUC1fw5EEUooUJO1TXIPn28NjqzSRt26
 jHotgjfyqwvcExv94wOyQCFHucoul9fLlDMBoJGS+lQJvh7oAv0UVUUeLFPoxtqPXhOln5OUp4WelRn8j9W+dgcJURuEhmcytRB8XKY6hHtKM2SYpcePi5RK
 sTE0Gh5EZXP2hzEvfyLMpoIe8ueOgFH6Pe6TO6EiF28dFi+gFASIGj1xPfEGKe+vfNKZ3LRF8lsm2b5u3RSm8abGY2TDPZroGksl1uvhWhJZZyesED6evKPl
 KcDZBjTUybu0lqd6U4t6YDpl3VDsdZz4ULj5VN35Waig2OS/UqdWoMM6Rt2N91ELYtGDwy8fRZQcSm0GpQuAQ1DGjsYkG9ujv8znr1VYnEDUsWGt2jedYJyV
 6vz69pMdr+j97Y3Crjct+igAvsBfW8XaOLRgH9sREsmKE2P/yqoSayBL6Z5iFGBFDfo=

On 10/02/25 07:04, Andy Shevchenko wrote:
>> Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
> 
> Hmm... Is Rodolfo indeed a correct to be mentioned here?
> I think you wanted Suggested-by with somebody else.

Honestly speaking, the patch was written by me, tested by Mohan, and suggested 
by you. :)

Then I proposed to Mohan to send the patch with other patches in his patch set, 
since this patch is logically connected with them.

Maybe we can put:

Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
Tested-by: Mohan Subramanian <subramanian.mohan@intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

?

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming

