Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D602040B5
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587175; cv=none; b=JNKJi+A7kBUJhtNck65THFuSDipP8ZR1JpVRw/AbLxOixmPXCcJglFK3oAEHoFfHBOFuERzJ9BILg+RUD6WJYfHsGNycqfBKdRmdnhqUDKpSo2m09aZUDHLWkIIqKVmg5W63XrdX0vCWNaINqFyfWOH8w74j224cjMLUJDPFhTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587175; c=relaxed/simple;
	bh=M3Kt5wuTT2F1a9ykRD0aslud2PJzB/uiZovD9dlqnhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6RsgJuSKKU3+nH3qmEK6rAR7tEDkrP6J+UyL5GbqWUWyr/49gp2YQN/vOzXOFMn2/0/rTZavVe8RpfCWeQQHaC91KRciFxxNU6C4H7snVG3E9IlDf93TqfvS8JUZsyHDBc52TZJapQYG26yW9zQqOOftSXY6MYqSozKzqGb+E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ZCfH9huD; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ZCfH9huD"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9291C3F220
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738587170;
	bh=VhF9k3IAhHoTNkD1u2+baAbQZJeo4gcwGS+UKXk5kHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=ZCfH9huD+6YOlrjzCinen471C1gSZLg0RZYDBToVk3dvuLZEDCYX5Yconbbip8Mr/
	 RG7JgCMPvdi9z8oKoeEPTC9ZA8a0tAqutj35Z7pzksiH5dfxZSDV6761YEoCnQuZfJ
	 IdOArzUJX76205+oo0ib1+UnbG9JF0rXqpWBL0v+FciPAkQVqSuOqT2GIe/lFFHHEY
	 i4FetNd++ZdWD77ABkzXD42M9DeY+jvNB9WxJoM8pxioF9RkNxOLUAtT24fMcErHAH
	 lVtHlYwswn2f7NegTCDOaqBm6Aup2BfXV2Xb7WSpIoYh3oU23aQlV5pwR7dXyjsxD7
	 4RimdHsZ+cv3Q==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21648ddd461so94603655ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738587169; x=1739191969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhF9k3IAhHoTNkD1u2+baAbQZJeo4gcwGS+UKXk5kHE=;
        b=W2lE54C6bRZCXhgqqEGH8avng/7eyHNXzi/84k/mI0kQiXffCQF7Gp3wBWLURtUBXZ
         0WbAoo8Chqq4pwxhX0ok58JqOzx5u82t9gppcHOWJ5JmhspyN7LdjSjX08NtzmWR2UZS
         N1WL1+isCD25r55751Dyu5QfUToCM27aSNOyF29Ha9ahaPunQNj1krv89bt3S4qknABk
         RO3huD3/+HQ3/QSnUMYrgOfgg1lN7yJL+vclDrfy/5WoilKR2A+NiK5iTVwOaTCdvrVq
         LM52kkpKvsRCxD2B35Lu5Cg7bPVKwZrrf6YQbxBbz4Hk0U2vLOt7uqOYvtEDWC4pcM5C
         Eulw==
X-Forwarded-Encrypted: i=1; AJvYcCVGbgEH3QfIq3zD2yjNLTKvyDopn2AURxY26osxSIetdrD2kB0zQGhesoYKkE/t2Be+Uj2FxMKnmXAOGxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwALno8Yam0tQKQwfrPikJYTDoxuV6I7jOJKwPpZGDntfrKYb/V
	e1qNqP2sXT9B+kfaB47BBIpWDD9nfltDiGMrzQLqf+nVDc9FwKIIVyIFjrtDLh01gWk+gtHWi9I
	j84UgQvIChxnrixTcHJDe8SqfeCn7Ok8oTpJRe3vVxM1rCEyOS0RQrqQlPSj3utwwSB/WEALzLL
	Ht9ycJPO0vXQ==
X-Gm-Gg: ASbGncu7Tvkk5R5KCERjT/rdESPNo1l5YaE3x/kHTM5gAkw78vV7rI1EeSblPklzGVg
	lRsfjvhCRp3PUrPE5LZ0d3yxKc/Yoz4k6XuD4thTc+xRkpiF6XSIzQNs+uYMjNhlWc9F+D1EjIH
	E+yKMUCxfLJ4/26EEWWrqPHuL6YM14FvSC+PGgdgqTecY8WvwJoSAzYiykYRStn7/qAizJ65PDV
	0EMWBtvgSBRa/jgsCaYxc/U6jmZOnSyM9OFT5lAEb4tPTXDZEtAkg+c7QrmM3/WvB8kPdBLlb7I
	1Hl7mA==
X-Received: by 2002:a17:903:94e:b0:216:3732:ade3 with SMTP id d9443c01a7336-21dd7dccd43mr372461825ad.35.1738587169141;
        Mon, 03 Feb 2025 04:52:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHq1JilL8IMgEMb6RFyRt1fZ/pZTJMiA95sSjtcqZY7jRlr/1d8Bt+XG9+yC5UbiPiWCNJwfw==
X-Received: by 2002:a17:903:94e:b0:216:3732:ade3 with SMTP id d9443c01a7336-21dd7dccd43mr372461495ad.35.1738587168698;
        Mon, 03 Feb 2025 04:52:48 -0800 (PST)
Received: from localhost ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebddbb1a4sm7873824a12.7.2025.02.03.04.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:52:48 -0800 (PST)
Date: Mon, 3 Feb 2025 21:52:46 +0900
From: Koichiro Den <koichiro.den@canonical.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpio: sim: lock hog configfs items if present
Message-ID: <ve5d4rxl7z3fcn7iowf4u6oeq6656ivdjxknrnnx7fshj44574@f23vcqbu6vhc>
References: <20250203110123.87701-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203110123.87701-1-brgl@bgdev.pl>

On Mon, Feb 03, 2025 at 12:01:23PM GMT, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Depending on the user config, the leaf entry may be the hog directory,
> not line. Check it and lock the correct item.
> 
> Fixes: 8bd76b3d3f3a ("gpio: sim: lock up configfs that an instantiated device depends on")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-sim.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index a086087ada17..b843682b47e9 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -1028,6 +1028,7 @@ gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
>  	struct configfs_subsystem *subsys = dev->group.cg_subsys;
>  	struct gpio_sim_bank *bank;
>  	struct gpio_sim_line *line;
> +	struct config_item *item;
>  
>  	/*
>  	 * The device only needs to depend on leaf line entries. This is
> @@ -1036,12 +1037,14 @@ gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
>  	 */
>  	list_for_each_entry(bank, &dev->bank_list, siblings) {
>  		list_for_each_entry(line, &bank->line_list, siblings) {
> +			item = line->hog ? &line->hog->item
> +					 : &line->group.cg_item;
> +
>  			if (lock)
> -				WARN_ON(configfs_depend_item_unlocked(
> -						subsys, &line->group.cg_item));
> +				WARN_ON(configfs_depend_item_unlocked(subsys,
> +								      item));
>  			else
> -				configfs_undepend_item_unlocked(
> -						&line->group.cg_item);
> +				configfs_undepend_item_unlocked(item);
>  		}
>  	}
>  }
> -- 
> 2.45.2
> 

Thanks for spotting this and the fix.

Tested-by: Koichiro Den <koichiro.den@canonical.com>
