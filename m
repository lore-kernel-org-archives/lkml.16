Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D442946BF
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 03:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738812962; cv=none; b=opV4NvoGsFdyG/8TzLyjZhuipM8a43JMvVPbZ5rg8GK6pVwNgcNQ4fR7sT4ZwjfiOOBxj8hIdBpK1L0Aph6mMMFCf6ZpN46FHx4G0+wMgX5+ZztMrYGVzMlcfH/0L2kNUZdWc+BYoLQzdZyA4/1slGFXRGNLANBhkau/IRKrZ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738812962; c=relaxed/simple;
	bh=SliaH8b6GjP5DO8bJ29b+UYqG8BQPICpMIb2A8l/7sM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcuCiChi2xax2BhEHBV+KhUmHGEv73GQa40j4J9iUQVX33K4MDTlo8IztoyQydpsTqyn8WscSiBHSDKrAv/6RIpeLw22gEH74aTB8IgGd4iFJscMEQi9W/XE/OKw0CRhxLuNqL+gk6oagLmhPC1cXnzVAFc9+4+8S7fMPCCjLKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QnVaRI4H; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QnVaRI4H"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f2cfd821eso8232155ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 19:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738812960; x=1739417760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5QdU5dLEWKXzhZsgVLEFYLWQnoZN9dNqbJWkrckt/Tc=;
        b=QnVaRI4H6uC3lt04xrNZl3RKLSvV3AAojwOMHmdJMiOP7jV8QD7aA5eijDHwiyLIgA
         rtKgVAW2DcvWcnAoyeYZ247oFednEnsWwZWoHf22fhNlwoXqdXogw4JobVfNP07PJ6Jk
         IJ2Ru3sGy8Pav2X9rsJTvrxQz51vZcEyPxmOOzEeIc5k9oXpZ40m2oPeibJVQohaW72n
         wraF+T4YMc3+eKu2T5kETNZP6n/ArJkxxnWUracXUB01oJR4OiH9lE79iiD0K8GZNgd7
         loSYtkKYhX6WVjhEoy4deVFcpNd+UreKDDkPPzOc8Ey0zJQNaJRfK0tpXCGQUnhtotja
         kpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738812960; x=1739417760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QdU5dLEWKXzhZsgVLEFYLWQnoZN9dNqbJWkrckt/Tc=;
        b=BMoAk6xU/9PhpfSh+i/EqKMd+4TAO3FqnD0tTyiDcOBrGQ/UGG5e9kI/3p6L2R/70J
         LZSUEbgGQwIVXEEIqe7QyMzM/vnnjXbbBbpvSgpQ5+5Fl5JZ+BcHiWbEa+gKOyaLqD/q
         YlxXMSYss2gvrMZqoLcqnp+yCNAqj4qIC5e1oYHyQHGUdtpVafxPd8YvuieEsY5apQSd
         6MhPIyMQwb6MahYGpnxL/vEYwfCxErzC5pc2ghVYPrcstOb+3TdDZNWTerISAuwIw4gR
         HTZVXc3KojpgOH9AAjWxqMBf7tWa3ZkWCdfmGtKqQ7Em7nYLIYctvYRCrT8e8yUzByjQ
         Ev+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrlX9mUKr28H8IBDDeY9DA+hJU+Xe0nNP8ECFUhXibE/XTquCr8Ota9Eij2PXOZ6+ODyRnBYyRaVHOA+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq6Rkw5QmAPj6iRDoWPCiH9CMTSoQxQczQhvwMP5v2rZQnd7pQ
	XCQ8RBzETl/6KCk65aQA+Zn063nbnbkBeYhkZeyESUtKSrtE5jQr+tbQdHdLMd50cRGUR/hecAa
	Q
X-Gm-Gg: ASbGnctpBAweGL2Sm1TvkVa55WCWco7KNRpCfbum24Wv5OJzH+W9KNz1oLHjdFP3VuU
	waJX26UUDT+LE7PYMTbd6o2HFijKjbV7tSZ/ForwBEY2nXhOlU/++VLr9IauHHxRwhAryLOqNNL
	mlRwTPc0dUB13+I33q3tA+cS5CfMsEJoJj5O/21H2MWHauOk1y8uvWkWt/Y6fphGSa1smtiw0bm
	hHPewDKrBnEwI6SE/xeiqqe1J601S9CkQwF+p7J28LXnXe27KekLBv1pd1Je2i2FUXu7BoueHP7
	+q5h+VP3EGjlp5J9VQ==
X-Google-Smtp-Source: AGHT+IFu8Ns2woiq6S/e2FUNHLRPplPpN02WxrN73BtCsPcLpHZ5SjLLdFbqjcsqRh2Jl0/9eiGzrQ==
X-Received: by 2002:a17:902:e5c7:b0:21f:db8:262d with SMTP id d9443c01a7336-21f17f02bdcmr101308555ad.35.1738812960121;
        Wed, 05 Feb 2025 19:36:00 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650f382sm1803545ad.29.2025.02.05.19.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 19:35:59 -0800 (PST)
Date: Thu, 6 Feb 2025 09:05:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: linux-next: manual merge of the cpufreq-arm tree with the pm tree
Message-ID: <20250206033555.q24q36txif37hzgu@vireshk-i7>
References: <20250206115034.5d3004c6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206115034.5d3004c6@canb.auug.org.au>

On 06-02-25, 11:50, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the cpufreq-arm tree got a conflict in:
> 
>   drivers/cpufreq/cpufreq.c
> 
> between commit:
> 
>   0813fd2e14ca ("cpufreq: prevent NULL dereference in cpufreq_online()")
> 
> from the pm tree and commit:
> 
>   60208a700f76 ("cpufreq: Restrict enabling boost on policies with no boost frequencies")
> 
> from the cpufreq-arm tree.

Fixed now.

-- 
viresh
