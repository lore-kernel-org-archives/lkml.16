Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF0C221F1D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836363; cv=none; b=DsoC9ANsfrH6v4BVJtwOHZcO14oKVlz1uuMt98Aejc6MOM5WeYEdKx2/hADBHzC9Dd1dZ6ScuwMwhRk2ocGukZ2IWrfNxg/Ep2PP/zzbuTnDYRo+N1jVLf9/6np9xwJZnTm9ZTRTJ63Zt0i412Hlvl+bjBTTWqivx/0kO3BqaoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836363; c=relaxed/simple;
	bh=Uri4+7GDEUPxQ/zMJozScs6gf7ZK85JBRYKKbs/kB7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwsFbe7QmrmssuSF1sOFj79KqZGAfagD09T5DE3tXRy45nIVOPfARW2nNvo+2er5Md/pVY6TqS/1sVUrO+6NVFyanB9Fw8dh8oX++MBnt+tcxCpq44rdtPDztOO92VfZMqk2iLWpywAIGj5unodvc0aRv4b8YBInlekB7I8xP6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Cw0UFYHE; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Cw0UFYHE"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b061a06f127so30701a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836361; x=1745441161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZswUWYqEVBTmYMarhm0YEpxYFGoYJ3ON3AdhVWeS0Rg=;
        b=Cw0UFYHEzoyHDBKOcM6HeGN5alRNzDmpDsAL9pLYT/3sAHtXQnuCmIwDeq3AsrfQIW
         w1QQ6KSvtagxnHPi4LbA0WSB8zzXL9RpXmai2ALEP8Vww04YWnqbBpru1pbbCziqTRTJ
         dbYwOeQCSaaA2AFM6NSbaqB5NgJl668jSqEXqpXC4BRf3NTIHEHUzSCcNG8vl5XAS73d
         y1yN6622UA7nnqwx5fwoss0fHgFdUiLIwHZsJl5K5gtMFGCPbsRWSuH/V+UoTuQKFoQd
         vDrV7e58n13iuZdyyII2RHJszIkQ4WDgZ4/4GGrygj6ayfXUJ0ZV75gVXUqLDlV4oxLy
         9zrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836361; x=1745441161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZswUWYqEVBTmYMarhm0YEpxYFGoYJ3ON3AdhVWeS0Rg=;
        b=RIeUqqIofw8RsxBMwAw4jYI1lHc2wdlFOo6ZPVsmrLLBTHdwnU062mMJ3S5WilHvot
         TH3Zad1i8DBo6tOeT2O/KPLJq9FqjTRLlBxjIz9IokajoK+GBedduxteBcyOOmIdfVfx
         iYhazOhNKjHV2B5tkckHXczG6ABANYLbW3zuNrN+dpuPXetoWgWnMuRtiTE7XfFaS2rU
         JIhygnjotKXgKteMvM8N/4gANWAxyEh8fjcycixEKrn0Zkgg/N97DPBtF9ctvr7CnhLG
         7q1FhcSxkJTVwyxKZfwhdVPytcO7YYc9MPRVplHQbWdADGhULR9URVmuK/XADyV4QvNj
         TNKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWS+vt9v8L4K5V8teBKBs7cbrDPr3smQkuZjeakN9FSFOV5yDetT5sH+act8zeyNtmlLfNy1xUsB4Ho+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS6WsK2D8ieJ63W7l3N881TbNET3TBvJN7SGZX3Am7NH258BN8
	ISLjV1qiqsIvfpbPWoZH5VCeSMR+w7p0fqG8rtDg5rRA/j2EJPEO3cu9aL26mA==
X-Gm-Gg: ASbGncu41UZoVU6LDsQNVHOXfQzc8uU1Lz7/Qwm8a2ACw0kMZwN350mkZ7AtRpRgH2Y
	E5moq/5tiCldOjABKuiYhLOMuaPS89KnISAVdh4zVDhuw3qo2Riejb3TXWHXOHeTEbFD+hsRmnq
	ebil4h+g7QymjiwBW2shJoE4uOJLT67f8AbUUtmBGAZ1hrRrS9KGWB/QzDhKrBznr2X5bQ0gi0b
	e5q7R/TmFBI+NYUlkan+4RmjhLGEqF7TTFabfNGguMfEqvRmVPKGtzN7mq2r1c7hn0RNepUMA6m
	6+/juDOhshhvCy2aE34aXLlAlypiW8Cjvth5qZEf+tbnDoXaPWVFdZ7kyIBmyE6t+w/DNCCTqo+
	+jDM+nQ==
X-Google-Smtp-Source: AGHT+IEoQ75P7zQq8T5JMPgGw1/cthcGWEStg5iGqMCnn2UbY6rivsWXiXhNhO25Mo4/qNBOSkcfyQ==
X-Received: by 2002:a17:90b:5247:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-30864172d65mr5494078a91.33.1744836361175;
        Wed, 16 Apr 2025 13:46:01 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308611d6166sm2115338a91.7.2025.04.16.13.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:46:00 -0700 (PDT)
Date: Wed, 16 Apr 2025 20:45:59 +0000
From: Michael Rubin <matchstick@neverthere.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, dpenkler@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/18] staging: gpib: struct typing for gpib_interface
Message-ID: <aAAXB60zJWB1qRHJ@tiamat>
References: <20250408222504.186992-1-matchstick@neverthere.org>
 <20250408222504.186992-2-matchstick@neverthere.org>
 <804eaa0e-e1ce-4ee2-8ad4-f56bedd6d14f@stanley.mountain>
 <Z_az87Yx-NJvGASJ@tiamat>
 <2025041512-coveting-scrimmage-9312@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041512-coveting-scrimmage-9312@gregkh>

On Tue, Apr 15, 2025 at 04:41:47PM +0200, Greg KH wrote:
> On Wed, Apr 09, 2025 at 05:52:51PM +0000, Michael Rubin wrote:
> > On Wed, Apr 09, 2025 at 11:26:41AM +0300, Dan Carpenter wrote:
> > > On Tue, Apr 08, 2025 at 10:24:47PM +0000, Michael Rubin wrote:
> > > > Using Linux code style for gpib_interface struct in .h to allow drivers to
> > > > migrate.
> > > > 
> > > > Adhering to Linux code style.
> > > > 
> > > > In general, a pointer, or a struct that has elements that can reasonably be
> > > > directly accessed should never be a typedef.
> > > > 
> > > > Reported by CheckPatch
> > > > 
> > > > WARNING: do not add new typedefs
> > > > 
> > > 
> > > This commit message is quite long but it's totally unrelated to what the
> > > patch does.
> > > 
> > > This commit message should just say "Having the word "_struct" in the
> > > name of the struct doesn't add any information so rename struct
> > > gpib_interface_struct to struct gpib_interface."
> > 
> > Thank you for the input. New commit marked v2 sent to the list.
> 
> I think we need a whole new v2 series, I can't just pick up 1 of the 18
> patches as a v2 as our tools will get very confused.  Can you just
> rebase and resend a v3 for the whole thing?

I sent a new series. Hope that it looks ok.

Michael
