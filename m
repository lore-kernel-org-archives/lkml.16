Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753AF1ADFFB
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747149982; cv=none; b=f/ROG//Dzi+ybwJFeH/+uZVW4bII65z/fE/7w8dO4sIeOoOntBjAna/rrdxNfTS5Ep1J28kqp6hmM5E0I832vuqj6hDzwaxDXjvTVmYhUfyC/k73fEwDWhGIs5cWHWkG9Sl/YEZF1PQpQOGmYv6eO69HquEESZ5qPq1RIfcdFak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747149982; c=relaxed/simple;
	bh=oSLfTwOfebog646sA1mZSi8+62TCjVHZ4DLwUTc/jjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcFiTpUikjH7qUYalXQNlZsPZYPJ3Cws3QoRIgUOFFRjFHuGbF7/rXF1rPwCDRfJOCPsE1XXx2xeswGVFF2DBC7RTqpxPxAP0RMKogAfTypVVsy+LPpi0R63rZ7UQAaGljNT1XX+tEgCs1R3EpUY2hV69XefWFQwKabvpQ3sV94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KTbJ858B; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KTbJ858B"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so66268125e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747149979; x=1747754779; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xmcB8gQFyNIvg8JURKk+JEi5mx8snrvYRFBE7I8p0T0=;
        b=KTbJ858BOYYlAm2Z/Ut9+WgmqNdrcWVhkBAscfNvhMAmph5LaQA4GOlDmAQJOhIYMF
         mXnmNlDQoz9CVQfGKRsIrfGBkHclroK4WQgJyeF6cxYtHzPCusCi8oB3xNW8sQTd2RII
         tPdhxP51LvYwt4fPYIteAe/xBRE5iv/AedU3eu4qJo0XZaijj3IgDAKQTkDtrQyljU+3
         Jx/cCDtghfjj+qJQe+7Bs4klp1dK3bzYF2SUHnCEbVTMm0nnquloUJgqTqCO1lpzBvn/
         yhoMKltDO6aNRb824GvTZbwC299w1OfOanyZp9Tjfbs+OrhTJG/BPVmAwwq4fUyILsDy
         Mr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747149979; x=1747754779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xmcB8gQFyNIvg8JURKk+JEi5mx8snrvYRFBE7I8p0T0=;
        b=Gb5uohtXa/tvr0Wk6bxp8vtcQ6l5Zx02p6lUjSl5pHqtZfiHSfPOT/a8bh94K1+2Cr
         UatZdXcJI4ZsAs/VBTpQH18uX+GxaX/u/Ou/7uWo51kM9zkSPeUdDp5AfLjuiJO8jnaF
         G5jHB3HtGsRG0PAYLGiK2o3QiyPhKbRUud5TsjjsTMMq/zq2GK660bEIw+S1KgN9vlBC
         eLXaYxAVrZndf1bpwcDOzBU9AslgWtiR2gY7oodjKq+scoqBl8fi2EetqYaxIU9OHb76
         D7I7sWckpCYxIKX+1RkQf6SadWmyEL6DgaV+scTwhzXHAk402pXe1EVUqzV1YG5SOI7o
         Pujg==
X-Forwarded-Encrypted: i=1; AJvYcCVTs32vLzU9T53BLT0PXy/b8GZuvsM+NUVDlNVBgsGVpoIHs5MKiFLXH8wIow11jYlskxaA0mGTQxB0zQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YypMvo5GlbkndU4uwV/JWN+vyMw+kZPgJxZpflgp8C05IpxaWUP
	ilhI83V/MLytiWCrstA7xUr8JAY6wAMRgJh9Wt23zq/dyHbs7nKBuTtgf0pFlxg=
X-Gm-Gg: ASbGncsWe1w2NQcktWXLLbJemdR1/kkrlJjKvhgCwOIPL84ACLGol5TddG4fgR+Gnh+
	oMIJ49bt7ZBm4Qw850veLskx0rPAXNDcUW465R2YYeuA7JDr+HcPOxdbv3tLfhj4Qf27pdmSISr
	SKs9BbkxhwW0N3fuoFZwvk4CjGzbEzCflCa6mc99rSTwrcPU5fFjo0bA/Pxfi9ApQKYHCIEji5M
	kQN3xYoXOwSBm29z7PxCYSUZeMfVtxn3KhBVB0YinI44Xy4mhlWt+3+h7sWQMvUvcl+MLyuZJlM
	GHbXrZcBOYVsT+aP9LR9wVlGeWpWPzBBCEXKKFZCh4xbk7kMKcc1hzmugh+l3sOR1MFetdxIG7a
	gEHOXsuAh/Xc1+w==
X-Google-Smtp-Source: AGHT+IHATfn9TRTLOTAhavKu9D+jbJzqaZe2/6qO1pPzjKVbpE+un6V0tEdk13nda5FV4+6YBmrqUA==
X-Received: by 2002:a05:600c:34d5:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-442d6d3e243mr178053375e9.10.1747149978722;
        Tue, 13 May 2025 08:26:18 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ac8csm167068485e9.33.2025.05.13.08.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:26:18 -0700 (PDT)
Date: Tue, 13 May 2025 17:26:16 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
Message-ID: <aCNkmCJK1wOLGmgy@mai.linaro.org>
References: <20250507134500.390547-1-cjd@cjdns.fr>
 <aCNWM5Xq7wnHVCrc@mai.linaro.org>
 <45166de2-8504-484d-90f6-6ef97c650b61@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45166de2-8504-484d-90f6-6ef97c650b61@cjdns.fr>

On Tue, May 13, 2025 at 04:31:05PM +0200, Caleb James DeLisle wrote:
> 
> On 13/05/2025 16:24, Daniel Lezcano wrote:
> > On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
> > > EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
> > > processors. They are found in xDSL and xPON modems, and contain PCM
> > > (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
> > > 
> > > The EcoNet MIPS SoCs are divided broadly into two families, the
> > > EN751221 family based on the 34Kc, and the EN751627 family based on
> > > the 1004Kc. Individual SoCs within a family are very similar, only
> > > with different peripherals.
> > > 
> > > This patchset adds basic "boots to a console" support for the EN751221
> > > family and adds SmartFiber XP8421-B, a low cost commercially available
> > > board that is useful for testing and development.
> > > 
> > > Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
> > > peripherals, and for historical reasons Airoha chips are sometimes
> > > referred to with the EN75xx prefix. However this is a different
> > > platform because Airoha chips are ARM based.
> > > 
> > > This patchset is against mips-next.
> > > 
> > > v4 -> v5
> > > * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
> > >    * Improve explanation of HPT timer in changelog
> > >    * Move pr_info to pr_debug per recommendation
> > >    * Remove pointless debug on spurious interrupt
> > >    * Small code-style change
> > Shall I pick the clocksource + bindings changes through my tree ?
> > 
> I'm new here so I don't know what that means for the merges which
> will happen later, but I don't see any reason to do otherwise.

The series introduces a new platform. The patches are touching
different susystems managed by different maintainers.

Usually, the changes are per subsystem, except when they are
interdependant.

Here you can choose to merge all the patches through the mips tree or
let the different maintainers to pick the changes related to the
subsystems they handle. You should clarify that in the cover
letter. If you choose the first alternative, then before merging the
changes, all maintainer should have blessed the patches with their
acked-by.


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
