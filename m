Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5F0221265
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 21:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746739645; cv=none; b=FrzqB5ZzGh9YhUztLYwPosazpFuTXsMEeOT8qPba1ezE/QnWREKxZtgeWKem2prPwoU8kfH5nzU5sDnB6bJG/Vpg8k1vICgzOwvcVxluYA5VSNiBH4HiML+cFMbAVN+tyJArAfdDKd6W5Yp4R9ZlrE8DWDFIkAuvYv5cjCQ9yS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746739645; c=relaxed/simple;
	bh=fCzAeA+bsdzOPRTHwXZH+gYz6BbrIA210lvJ88aZzEk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVLoGt0lH1qpCWEHT7Q6eAgoB13nQsAOqDPk86/kOexbqaLORxBzU7AleIT6JjBbysziYPq69cs2jHJIyOtsscIEpUQ7OSd9ue7oCboW7a5kLgCtsV+udXGDNzY2Tz4vbrgkrLTrLwo749RvY17HJMax2SqbvNIXHSUzeiQFkDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aQUaSnwq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aQUaSnwq"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ace3b03c043so231886166b.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746739641; x=1747344441; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RsP3zSsWFA5v6LbTV5x///CFgvw9t5S4qJvm6DV5CyA=;
        b=aQUaSnwq9CZ+ghu5lwdeZf3CVaUza4v3M66f/vZsmQa2M4eBHo78p2Jf3eswNRTbYk
         LO229eIjv6aeOXdg+wor6Ma7aiBPLMTYki2Z8gqg1cWK4WHZH6HOAhb8C8LVWDwi1qkh
         x4ALBKyO0iGrgQtFDzHZ5tDZYOHxTFRgAwuBnsRTSAuOIf4XQ1qF47P+Y32ZFY0j4vWs
         9WRJGmUKMG8udAvmbA2jd/+d8nQe0sW46lMGiv1KkmYvey8HOvTri/wvlqJhG20noN91
         P26uEVOWal5F6SzgCyetReQCISBrvoYKFTznR+Y1qV7JNn9VTwEC7hqJpi01q/NedTTI
         XSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746739641; x=1747344441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsP3zSsWFA5v6LbTV5x///CFgvw9t5S4qJvm6DV5CyA=;
        b=o19DtnfBwZRlqD/vay864g+iNV/F9UzAytKhyLfOgujB/cpkoUjvhq9OVw8gf7lQe5
         8edSxVOGtNh9k09VeVRRLnlCWr2JQGYysiLKSmge47HYUUQiUM9hLCv7GRSSjJx+Fciv
         HcMUG70vv52z93C8/j8ny8xCaBfmgKVkG8GABW2K5Zk00wK5nOc2wmxvBgfqOojd6L55
         VkuQedKC/l8H3j3w7pnQfplWQpnNzcs/dzxVqfOoenaVt1YhFQMoBU9VXLaesyW23GVu
         Oez1FBrt9nG5ZsQUXx4gHphmW3LUYzwU8QrcN9qjQaqKC6pXLuGtppQ5zrhCWX88iI4i
         Pmcw==
X-Forwarded-Encrypted: i=1; AJvYcCUa7G4l/fryCOSa3w6jPQru6RhIIHsjgUMYW42oNXJlgbp1V0jy5cP+tCaZL9lA5CqHqiKXKzbprD+PE+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwXCTr/5jqfn0j15MT5DW5umELBki0Mf6fGstNNcYQVJ9VRN6i
	VtHHsQhlaUuAJh+gKF2rKxBuaZqfdB0zs5+8FtDb/bQEpHAbq7oQWT8gzlCcsso=
X-Gm-Gg: ASbGnctyMTM+a65pGwnmJiZxq2uI93L3w5JztoRNAcVkHvKmRftX3LvcNmN0SY2QZYn
	az58m4zmcczhsPSOFHc7y/LXdxzaxy8fuZyWF7W5oszgZsRjxOxc/4vFvfDrxycQY5OAXs+DiKC
	x9QcA9kd7ad4/4pn1c/3atLBAOLE2eoxbCVpL5TeQ2aOLVmkdAIDTULQ1qPhTzaGcUZDTwOeqvS
	VSy1OA/yDJFUHpk16zOH01b30OlQSMTvPfay6bkm+hWQVanX0nKW6DYCBs3RmKJB6lbzpXAowTq
	iVNLU6El4tvUBYFHgIPZlw0PercOvaO38i68jxSJV/swDTfxvXZDH9HO8PCVG+xC7Ann+zg=
X-Google-Smtp-Source: AGHT+IGwowNKNf6YdL0s+pZvYQ6xsCLedq0Pezu/34sukHINlGhsBSD9rVYZ5MZsMsdJMGy3cL3uig==
X-Received: by 2002:a17:907:1b05:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-ad218e48fe4mr115728366b.3.1746739640793;
        Thu, 08 May 2025 14:27:20 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192d4a1dsm46249766b.17.2025.05.08.14.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:27:20 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 8 May 2025 23:28:48 +0200
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Matthias Brugger <mbrugger@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Phi l Elwell <phil@raspberrypi.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	kernel-list@raspberrypi.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v9 -next 04/12] clk: rp1: Add support for clocks provided
 by RP1
Message-ID: <aB0iEHqYmNxXQd8c@apocalypse>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <e8a9c2cd6b4b2af8038048cda179ebbf70891ba7.1745347417.git.andrea.porta@suse.com>
 <a61159b7b34c29323cdc428bb34acfa1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a61159b7b34c29323cdc428bb34acfa1@kernel.org>

Hi Stephen,

On 13:01 Wed 07 May     , Stephen Boyd wrote:
> Quoting Andrea della Porta (2025-04-22 11:53:13)
> > diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
> > new file mode 100644

...

> > +
> > +       /* There must be a gap for the AUX selector */
> > +       if (WARN_ON_ONCE(clock_data->num_std_parents > AUX_SEL &&
> > +                        desc->hw.init->parent_data[AUX_SEL].index != -1))
> 
> Why is there a gap? Can't the parents that the clk framework sees be
> 
> 	[0, num_std_parents) + [num_std_parents, num_aux_parents + num_std_parents)
> 
> without an empty parent in the middle?
> 

The pos 1 in the parent index array is used to select one of the AUX clocks. 
Besides this, the index maps directly to the value that should be written in hw,
avoiding remapping. It's possible to use a numbering scheme like the one you
proposed, but in this case we need to complicate the code adding the renumbering
where the index is written in hw.

...

> > +
> > +static const struct clk_parent_data clk_sys_parents[] = {
> > +       { .index = 0 },
> > +       { .index = -1 },
> 
> Why is there a gap here?
>

Same answer as above.

Many thanks,
Andrea 
