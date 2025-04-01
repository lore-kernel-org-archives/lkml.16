Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C596C20E339
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525820; cv=none; b=XHAMwzSqcmJ6tjRekrYncxbIkeVXyZacsj693y04DiXf0gMQVrofaEt0x1YYp65XnndjkNrabCjf7ezullZRnd3AeIWlSUa1cVld2O3Ys7s8n5OBSUCyc73zJ4Syk/QihuHxvNPrkCuMPvUru9oreykbUH/4YuqRSQMOm0fvTvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525820; c=relaxed/simple;
	bh=T91CpCnTj0xwyklVrpy6lRrUPs8IsdueChwCeJaJSdU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFbsAgZHlIntrOSJ8OIUhnCn3weS4eFkpijQGVXQubHTmO+ncr71zoFgjJsijIctPvCLvz7bhN14ziu7L1dyfWr/TMEQ4TkD2k8soY7wGfwo9HS0loHoNNE5iq+GXGd0/UoswCHYcGcuy+UpRRUeCuiJSLN5lPAC5G+LQee8+co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4geNtSl; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4geNtSl"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54acc04516fso5497904e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743525817; x=1744130617; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VtRsoKUnzY62F16ZzyXgTuIuFUdJK0crZF8UmK0ccK4=;
        b=e4geNtSld637eol2NXKVCCjo24wtJ83gkmKm7AxvxgYriRxpvgM3ELn6klIdjNOGCp
         rg47dDTvfwoFJ5DQjB8WNocPJDBTJCg/OQ9LQ7cUH4NL2V+dPd8jk/qSX3WMCv0jZF0s
         4Vqga9wNv+KANDVnK2pRu6FxQl0IlNVU4MW+AbfpIYNtHkASUuPqH95R2RGDUpv0YNzU
         fzG19MMeEylAC2a2r6mhy6lvNO3QsohuOsoSZB6iYaHbh0q/cOJYkeov1s6dPpclakyX
         QAPzvxNz0codrOMhTZ0B5bhpOWgMXXbie50G91ytlG+xq0D82fzivIwTAVd9h8zZ3A7a
         AMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525817; x=1744130617;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VtRsoKUnzY62F16ZzyXgTuIuFUdJK0crZF8UmK0ccK4=;
        b=RHeXZEhyI9D8dSGC90ksddIyZYZFQgeSraBSJlui5s1BlwHQ3Somsnvslzex+IrWBm
         kPNv60CVKZyIpF9YhImNz4daQi3XTpDpZldmAh+me1ub6Wav2a7mJkETntLLF/XR5o3/
         pXMfMwQaYF15dvXEwi0wj01uxzn/hGDzcc//zOFa5I/5YfbUnyuz2uA4n7HD8wYvwnUn
         XSnpOnHv9SNxRqBwiJMhFC72KtLERawVxQVALG08ctQoRY7LhUUW7Qw63OQEesQw852e
         mKyIzwq/amniJCXnDap+MsVifaV283Zdnqduo3cUATLgUyuHxULdG5NF8OFUrdTFnCq5
         9JRw==
X-Forwarded-Encrypted: i=1; AJvYcCW82UDbmGVoCG0CQ3Ra+LQ6L3rsbFzEmSXEFORITCBCu9rDg++Jyb+m+EqxjvS0MIvmGoLR9v1xW1Jnrn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXbAtUdxKiRZH1wlHEu6ZSk895tzg/kIW8BsMha3wkR87lpPmk
	9ZLW44PHCe+mCwhZDG5QO9QzBs+dNEuih7JeMwKe44TIPOdB7fQ9
X-Gm-Gg: ASbGncvcqvnvrLFSh615jcMEnxifb0WdkOUlTp2hSL8BzdoOx0U18G7Tm8Zw+51vw8Y
	d5x2QuBUP8DZqsJvi4JGU7K1PVVwvRnQT+DnmxM7KtG5N9OOUj0ilEneqORMoiz4ctYf2vO79Lp
	yN7LDDMfvtumbyv9rf9PYLhs+Km9l1CaZxpR/mBI5cNLZOP+ZpNRj2ylPgIzY0iyE8DXfww8xRi
	ltqS9XAQSbAp63dmITjpbz14ts864P3W7ivX0DeluESdWT8MuhUQYKe3QLv2oTa72pWC09Puwoo
	jsy+s9Bbx4M=
X-Google-Smtp-Source: AGHT+IGMjSOepmGd10i7LRathTc4xjO90nBV59dTN5qeuRROXT3Ts5jebW4tDpW5dseK5F3H7TQf1g==
X-Received: by 2002:a05:6512:31c7:b0:54a:fa47:b2a5 with SMTP id 2adb3069b0e04-54b10ecad2cmr3731763e87.23.1743525816549;
        Tue, 01 Apr 2025 09:43:36 -0700 (PDT)
Received: from pc636 ([2001:9b1:d5a0:a500::800])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c1ab6sm1412989e87.97.2025.04.01.09.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:43:35 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 1 Apr 2025 18:43:33 +0200
To: Huan Yang <link@vivo.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/1] Introduce vmap_file()
Message-ID: <Z-wXtZfrxVXfjFIB@pc636>
References: <20250328211349.845857-1-vishal.moola@gmail.com>
 <02ba63ed-ef1c-426d-b469-09878c5f03d7@vivo.com>
 <Z-tGXf5mfTclxZgl@fedora>
 <a3618dd8-5b4d-45d7-b619-1c89ca7fd6b5@vivo.com>
 <Z-tbTWP5MYzwrRYX@fedora>
 <efd24da3-2da2-4acb-be7d-a070a78b80bf@vivo.com>
 <Z-u2O_MO1NWP42kL@pc636>
 <a0b86b75-5f84-4cf2-b69e-c20dd9d025fc@vivo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0b86b75-5f84-4cf2-b69e-c20dd9d025fc@vivo.com>

On Tue, Apr 01, 2025 at 07:09:57PM +0800, Huan Yang wrote:
> 
> 在 2025/4/1 17:47, Uladzislau Rezki 写道:
> > On Tue, Apr 01, 2025 at 02:08:53PM +0800, Huan Yang wrote:
> > > 在 2025/4/1 11:19, Vishal Moola (Oracle) 写道:
> > > > On Tue, Apr 01, 2025 at 10:21:46AM +0800, Huan Yang wrote:
> > > > > 在 2025/4/1 09:50, Vishal Moola (Oracle) 写道:
> > > > > > On Mon, Mar 31, 2025 at 10:05:53AM +0800, Huan Yang wrote:
> > > > > > > HI Vishal,
> > > > > > > 
> > > > > > > 在 2025/3/29 05:13, Vishal Moola (Oracle) 写道:
> > > > > > > > Currently, users have to call vmap() or vmap_pfn() to map pages to
> > > > > > > > kernel virtual space. vmap_pfn() is for special pages (i.e. pfns
> > > > > > > > without struct page). vmap() handles normal pages.
> > > > > > > > 
> > > > > > > > With large folios, we may want to map ranges that only span
> > > > > > > > part of a folio (i.e. mapping half of a 2Mb folio).
> > > > > > > > vmap_file() will allow us to do so.
> > > > > > > You mention vmap_file can support range folio vmap, but when I look code, I can't figure out
> > > > > > > 
> > > > > > > how to use, maybe I missed something? :)
> > > > > > I took a look at the udma-buf code. Rather than iterating through the
> > > > > > folios using pfns, you can calculate the corresponding file offsets
> > > > > > (maybe you already have them?) to map the desired folios.
> > > > > Currently udmabuf folio's not simple based on file(even each memory from memfd). User can provide
> > > > > 
> > > > > random range of memfd  to udmabuf to use. For example:
> > > > > 
> > > > > We get a memfd maybe 4M, user split it into [0, 2M), [1M, 2M), [2M, 4M), so you can see 1M-2M range repeat.
> > > > > 
> > > > > This range can gathered by udmabuf_create_list, then udmabuf use it. So, udmabuf record it by folio array+offset array.
> Here, :)
> > > > I was thinking you could call vmap_file() on every sub-range and use
> > > > those addresses. It should work, we'd have to look at making udmabuf api's
> > > > support it.
> > > Hmmm, how to get contigous virtual address? Or there are a way to merge each split vmap's return address?
> > > 
> > The patch in question maps whole file to continues memory as i see, but
> > i can miss something. Partly populate technique requires to get an area
> Hmm, maybe you missed ahead talk, I point above. :)
>
I pointed to how BPF does it, probably it would just give you both some
extra input.

--
Uladzislau Rezki
