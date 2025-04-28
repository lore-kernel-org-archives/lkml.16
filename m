Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B803E20E71E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745881647; cv=none; b=O21e0Jw8gx0Bw6PoUudve7gfQVVqukhq5njwwCQprdfgFm98DoZNICSR607QS8V+0SjcaKFM7cdBEJ+Ib74//p1paCztH5sLDk5U1iRsXLND6ciioX67Yi5xmZfrLOy7d95UH2qjC8k3xW2QkwjLSVcNflJ5BnB2pP/Sp1Dvpww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745881647; c=relaxed/simple;
	bh=apnH3bEuRUU8KI+YFuI5iLEfzLc9vXU3H3OL8ulbcSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaRFN/09x+ZW8XSiKJhJnr/P30O8hezDvvxBvd60BeK6uUcvshTrnwUFyPxcsL94s2SRqj9jrGaGQTxpIM9Uub3ydyucuxDxyxgp7Qx2//0Ua+Zb8oQ79mtpXQ/eWHwnydPtUpG/SXJPUdRKY33y5r8swQiFTw9lzgdDc1LmyvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QZo4e2y2; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QZo4e2y2"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3cda56e1dffso31133825ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745881645; x=1746486445; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XPP/5KGfjBnqjCuxTaAmBO1WBCG9qi44AyjUIhX5v40=;
        b=QZo4e2y27m6weg7DF/PxOujhHz5t2kEHEmlbuYnkzboHrwA7+n15vEsMALsKmtFsy0
         6ZJ15Yn9kircxl+6Gj+cYcbUu4bsXZYMiGAfUf3AFAfoc6skzy/jVAXHgOj2eLWCdn7z
         CmRl7Z8R4syyU+oMQrmPwVBX2425DroLm1Cdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745881645; x=1746486445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPP/5KGfjBnqjCuxTaAmBO1WBCG9qi44AyjUIhX5v40=;
        b=BgpxxJpAcO+lRrfh0eddx21p8zb8g9nF93BP52ffgewp+IW5pix3MVggM0ffdPOGda
         dm1iTekAO4KX/6dwoXrye5hlwrEs9M3kxPO60NvvkF4ir60LVg3/03nP6uEKcab6EopB
         CnvOmuAEOun42xaIZKuRdOI/a/KgemCEsYPflAa/PzNR0RSy7E0REHoJ5RJOoOklsoVm
         oXNkKkE+YXVLrkcvLGRju18SdiEpSaFf5IDlGc6AxQICuUgv6NZZKbWotvPsA9LFjzct
         FWmNFNHRNZKigd+i/aS/P1KfiXZGHCrli9d19Sy4mJ2O5pl6ui/12qU3rTppQZTZVO4F
         uABQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUNeR+65uw7ZOIUeN3WyVX9CwP49S5NPvJ4qR15YigjFowsVcjKLBRaVTfyM1UQHIbhKSdMr4zGTbJIRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhSuuUDI0UrzeoRU+lN9R8nLnMaZmFyvuYdYc82f9O+W7Hp1hB
	/GrguCVpi4oMVPoa1B9m0FOKNcoXnahYv5Cc16jAd7fSclua2lCUHxiorSjanCOAv0B+fi6qf6v
	C
X-Gm-Gg: ASbGncv/J/No6tjI1yZqg+0G9zSWxGUfMyxWZUVhfXKwJfID02fkYPX0PrUvzICij9y
	the3dR+DDN0Wdzy5yf7zVQIuBQ8ALsrpp6nqvAV6+hIruvY+zPNi87eeVbdFhlXX0cj8nU0zDOl
	gMRtQ/QA/TnRJU0lAo0NHxAlUJFHWlo4w+TIiznVDX2IjS0AMZtne8nyMtmSVmG2Q+VDZvBBWwk
	1rXpOAnlAsvOdXUBMs021CZjTvaxaISsB4GxMMVupactLqERfWP9UPG8PYb0pHmX2xtEbFKsR+n
	QwDYoYxu1wORoGjp3QWQOhSWH1whk8IKhs79ioAMsnEYcMH+5G4r5fBL93hYYA==
X-Google-Smtp-Source: AGHT+IHQE+85TMfrsbnGODRvg4LxK3jcR91C6KwZlgnW7IxUBMmbkKOZWfg0RaAUTwvghI7wsv/I0A==
X-Received: by 2002:a05:6e02:1489:b0:3d8:1fe7:4439 with SMTP id e9e14a558f8ab-3d942e05e9bmr107015395ab.17.1745881644663;
        Mon, 28 Apr 2025 16:07:24 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f8631a1327sm31454173.142.2025.04.28.16.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 16:07:24 -0700 (PDT)
Message-ID: <097ad0fd-db38-4174-8e34-4ceb485e7e23@linuxfoundation.org>
Date: Mon, 28 Apr 2025 17:07:23 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: set the dma mask to 64bit default for vhci-driver
To: Greg KH <gregkh@linuxfoundation.org>, Zongmin Zhou <min_halo@163.com>
Cc: Christoph Hellwig <hch@infradead.org>, i@zenithal.me,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, shuah@kernel.org,
 valentina.manea.m@gmail.com, Zongmin Zhou <zhouzongmin@kylinos.cn>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <3e1f8fab-0155-4ff9-800d-5fa9df88c48c@linuxfoundation.org>
 <20250422063409.607859-1-min_halo@163.com> <aAdEM0crDfSP9JYf@infradead.org>
 <4c6660a6-29ce-4b97-b092-8fc15585e52a@163.com>
 <2025042512-corsage-handpick-bf2a@gregkh>
 <575ce02c-9128-4098-a852-d9e14f14010e@163.com>
 <2025042812-sinister-shaping-bded@gregkh>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <2025042812-sinister-shaping-bded@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/28/25 04:04, Greg KH wrote:
> A: http://en.wikipedia.org/wiki/Top_post
> Q: Were do I find info about this thing called top-posting?
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
> 
> A: No.
> Q: Should I include quotations after my reply?
> 
> http://daringfireball.net/2007/07/on_top
> 
> On Mon, Apr 28, 2025 at 05:51:08PM +0800, Zongmin Zhou wrote:
>> Dear Greg and Shuah,
>>
>> I found out that the vhci-hcd driver added this virtual device
>> as a platform device from the very beginning since 2014.
> 
> Ah, I should have caught it back then, but at the time there really
> wasn't another option.
> 

>> I'm just getting in touch with this module and
>> don't have a deep understanding of it，shuah should be clearer.

faux_device should work fine for this. We do have to test of course.

There are several examples of converting  platform device to faux device.

72239a78f9f5b9f05ea4bb7a15b92807906dab71
dcd2a9a5550ef556c8fc11601a0f729fb71ead5d

> 
> See the recent patches I did converting drivers to use the faux bus
> code, it should be pretty simple to do.
> 
>> I don't know if using the faux bus to replace the platform bus can solve the
>> problem that the error limitation on max_hw_sectors for usbip device
>> since commit d74ffae8b8dd applied.
> 
> That is for the storage driver, not usbip.  As the faux bus does not
> have any real dma operations, this should cause it to work properly
> given the default values involed, but that's up to you to test to verify
> it does just that.  Try it and see!
> 
>> But this change will request user to update kernel version to support faux
>> bus.
> 
> That's just a normal kernel update to a newer version, what is wrong
> with that?

With one difference that the fix depends on faux_device feature - hence
we can't apply it to stables. I do think it is the right direction to
go to faux_device.

> 
>> This will also be an expensive change to fix the problem?
> 
> Fixing things properly is the correct thing to do in all cases.
> 

Zongmin, do let me know if you are unable to make the change.

thanks,
-- Shuah
