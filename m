Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C451C3C07
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 14:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743258757; cv=none; b=L5YaiGCfyZHLZ0WwCvajBA5DB+ifU05tWSbQB3cqOY7tDfphn/CXX1/L4Hywhd9bhUbQ7+Oo/2PBWGTxihzHXvPx9F9+vnhsmxUaW9HBeMcfvbfOohqObmUegvJRA72i4qGYVNWVOovEUrV1nrAE6anCDWoOQ/M0OchmQoc84dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743258757; c=relaxed/simple;
	bh=Cf8QRuBHzGTj3EpbgfOpI8Dc180sRYRxMhwtcFoAbHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BquufaW7G4jpkkzYnE5X1kZINkCMcewP3IQRwPGOpUgBZVD2V/MZ8W+PZ18PZ20/OZVfM1MRiWyhOUQmQFnrC8aiye5l4q0tZa/d9DPSoFg0DZV1lDcTL+RdpuPQ5o3rlzeR4mdzc4HZ2N/Davfw/pILrAbzB+DFF1xkU3B/3TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LiSogFoV; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LiSogFoV"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c54a9d3fcaso298503485a.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 07:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743258755; x=1743863555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cf8QRuBHzGTj3EpbgfOpI8Dc180sRYRxMhwtcFoAbHM=;
        b=LiSogFoVXFIl0+dfIjFBFpSHXHlPQFOIraqW/LNm9dhMhK6Ylh59+Pbvqgl+qWhbI4
         LqHFJHozYoaoX+ARyXD39qf/0mhY4lBwHIig9wBu/URxp1Y/oBFYNVVV5n7yQEsZ4VMm
         m6QmATA6fPyEKdSDk1vlRif2bCLx6kj6566aK7Ndq5bxxkZZqzs3DBcpsPX1u25gxKUo
         48cUzpYVLmu/VkveSZW0TGllESo3Ao7IUgE2j0/IfmWX55gmw9665V+7KBKs7gY/SAv6
         5Geepe4F2+wHyCvH42SXgtgQET9gzVFz8XJS534kICmNQGB7DyefzWUvBP7/MiXr6J8I
         eKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743258755; x=1743863555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cf8QRuBHzGTj3EpbgfOpI8Dc180sRYRxMhwtcFoAbHM=;
        b=kkzAvHvyrp9KSDmK0yaQd88xMWaAFFPruW8DxgHe9RE0pHa4VbwxNmuN3JsC7lA7jI
         s3RXO8XvEUg4JcGZat/+45dJDGj0Nd5cgPaYgDOEoR4btvzM5eiJ9cpaOO5WKuZnlPvA
         kbhVBPw6smuAr5z8by0Ei+5/dTwWys0Jpn5X2mcU56P6m6pWba77nxJbnz30tIApcW6z
         3S5XTxNE213RDzP4hICuCpWfUn5vRFNdQuSY2nIIpJP/cmhxFaDoHHP7OmliED0LajcX
         x12mTwi4qJ0Gw/YtYz0CVdyNNF3eKiF3obVPgYLV9AsPr1acxyj7wg/EgotD+/mJLRr4
         uAmg==
X-Forwarded-Encrypted: i=1; AJvYcCX5hBIwLUvPZZ55LZ8Bb/eOa34fxyAp73naGUr/AGFDtJJLxShxuNoTChNtjCs3lY8v5bhRNk/pCBMJZAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YySsSmbilq2BApJlk2aIzR11iDZE96XJh1MN5JoddihLlxOmVw9
	K/63aQaHV6dtU6vGCuauVKGmvv7AWYmB7eyX7c6Hz+cCqxZdvTqomIYufBNh/A==
X-Gm-Gg: ASbGncvwwaol8BPSvzJdU2dOV8f7mCdqjsH+IJRa9UGjoCsbvhCD1BpmBkdmY0v4bLa
	Mw4PtdFL6IL+6E9PA8gRcVgS0JTGuElqfoLiTHO9F3r8IRA8T3qyupz6KhmYybYBhwTpAdD6rbh
	pWTxxsp63Y9ZW+hd5E9QpfTdGL68LHwZXS0EHAFiiQQWmMkbKrLvYrL2TGf9mjPVYS/xFD5SzsX
	0yj2rwSbdu8v/c1RWsulsB3y56nrjFP5ebJ9sITS3bP8cnJTVDBiyAnE3C8fs6McFAm01LLMatk
	DNhVgKNJ5a4Gyj0WTP92yDOMGdxnVj5heIEGiizr54w2LTlUErKrZhM=
X-Google-Smtp-Source: AGHT+IF0cQy0jr4KMVVkh8U0F52O1lJsPAgFLz9t15YfkUtmvE3yApsTmKKf0mX9v2iGYZlTkuZukQ==
X-Received: by 2002:a05:620a:19aa:b0:7c5:5d32:2612 with SMTP id af79cd13be357-7c690890ef3mr378710685a.58.1743258754701;
        Sat, 29 Mar 2025 07:32:34 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::df1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7659ad8sm249276685a.22.2025.03.29.07.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 07:32:34 -0700 (PDT)
Date: Sat, 29 Mar 2025 10:32:31 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Mingcong Bai <baimingcong@loongson.cn>
Subject: Re: [PATCH V2] USB: OHCI: Add quirk for LS7A OHCI controller (rev
 0x02)
Message-ID: <4bbbf646-318d-4805-98df-67eecf040de9@rowland.harvard.edu>
References: <20250327044840.3179796-1-chenhuacai@loongson.cn>
 <208f5310-5932-402b-9980-0225e67f2d66@rowland.harvard.edu>
 <CAAhV-H4aitynD20EEWQhF_uv79+1nw7sKxzd7c_+009oY63tEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H4aitynD20EEWQhF_uv79+1nw7sKxzd7c_+009oY63tEg@mail.gmail.com>

On Sat, Mar 29, 2025 at 04:40:59PM +0800, Huacai Chen wrote:
> Thanks, V3 is sent:
> https://lore.kernel.org/linux-usb/20250328040059.3672979-1-chenhuacai@loongson.cn/T/#u

Okay, it looks good.

Alan Stern
