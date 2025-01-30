Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CD2139B
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254372; cv=none; b=u569Qjdg7DkIzd5eZcx+KZ9YGoxKu1mK8KE55taOzBz6TAonkDayr6kBb6E8W+5N9tsbdj0bxOpollLlz5JzDyln09GNbOw99CQNx/cV/rHqJ1Za/o9ny4La6z6Of4Uh1+KU77O6krA2JS3XHd9qUSVHCfFHm7QAI9lv8l1czJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254372; c=relaxed/simple;
	bh=9ORXU9xp+yfOWrwhTIVPTgQagM73q2aaZQtDqYwm300=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWPAD+4pamfI2lqsniLanNw1tVOr66lLIiLVHmk/NSL06CFUfEZXwyx/Rv3MCs2tO+Xak8f91qaZIr2oJ8XeH2X51nIb2wJ/dAfPP3yajjQxSf71EgqKmdDr+LT6+ePbP5csitl6dG/KbePOuowutiUU86x6q1NTzA671PDzTiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=YxVHJjx8; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="YxVHJjx8"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6dd1b895541so20542246d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738254369; x=1738859169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFJun+65leLVhnu3FjKXbxUekmn1THbonCmFZrm06tI=;
        b=YxVHJjx8DMPMrx1+m0jM9ixRXKX0RKKvOoBwkf8e9cr65BU0BcKzMCL05zGLA8vj45
         uBH/U6iGvb6dEi0qIeOOnZNiLLnZFtIdBkR75LaeUodBNSSdaXhKUNVOTJpk/7f8yDpB
         1l1VpiEXDrki3fApbiXspW++XKOcfa6dC8D78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738254369; x=1738859169;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wFJun+65leLVhnu3FjKXbxUekmn1THbonCmFZrm06tI=;
        b=htn1DwxlYaFsxEGNeH/TKIgtbUPlXdGkQDjFHcXiccKpwoRe7a9vC0kQ0UGTaCCzwE
         uw4JdaYnk6HIYbHN13u8d77JEaSq6uRAGjkCe1zPRTUFL5YBh84ll96Hk6RkRIALeF78
         E7wH7bWK/JxryQSQQLvMt+8c2LQVqxMiLgsyHlSR53TVFI7V1CTDRUfFWr/xhUpn6t6q
         tbzw1Ty+793FGA5pT8V2dnRYSVfal2ita1+T/7fPpFzrgd6fNImnwXvhXlQMVECa+ad6
         Or/+BDl3v4QXEFY7LfuOkh0Az+Ti7JXOisUD/MDILP5V6v1dpqHWiv8wflBwSPWAF5OQ
         0IeA==
X-Forwarded-Encrypted: i=1; AJvYcCUIcBi9w/WaDpVhjjE2/2c+Ine1PO/KKIR4v5BWA5HVfIiVBTJx7UfvTgsHt/u5cG4zBOGS8dv6H8bGtCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOo5H8Z7OUa9WzFeztaN00tUjR3Qst84o5F3Z8HinoopHbSQYG
	LCRnqdVpxxv2bupNkKvS5wK4mKZk7u+TUNExryUYeYORvAjvxQY/SVjND8fFafo=
X-Gm-Gg: ASbGncuPRQf6Exleh8lzejZrG3W/vQCG4waJNNI/kXZZZL0x9JD06aU3pqiTBcbc+h0
	8FpuJyXT8Y84YCejjDkAXH7Poodda1HoH2Qrrrm94PPZvqxS4vY9qvSe6AQciYEFjWvwhzQjKVh
	8f9z3Hu9YUW5gHT+MiwqF0MqXDF5NBJHDAPuMbYNNL78x0oHCLTYK0WwtHrSnVrtHGoGJ3yCkfR
	R4yq843RLCdOTbnH0F237mUtu/jmmh1rDvgE+YLjjfrChIWCWc94AWthMkpbNJ1YK3CAdmhNIXJ
	fe7gOWdxPj7L1Yvk8IHI
X-Google-Smtp-Source: AGHT+IFCtbiT5jitHYjlOB5KglRFMHJCSGApdMl8EWMtvRA1gCdNmiZdo9EppRnTbuH+0Zr2ViLTcA==
X-Received: by 2002:a05:6214:4a8e:b0:6d8:9be9:7d57 with SMTP id 6a1803df08f44-6e243c7f716mr149666086d6.37.1738254369421;
        Thu, 30 Jan 2025 08:26:09 -0800 (PST)
Received: from LQ3V64L9R2 ([208.64.28.18])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2547f0e0bsm7726436d6.20.2025.01.30.08.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:26:09 -0800 (PST)
Date: Thu, 30 Jan 2025 11:26:07 -0500
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, sridhar.samudrala@intel.com,
	Donald Hunter <donald.hunter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Mina Almasry <almasrymina@google.com>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Daniel Jurgens <danielj@nvidia.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC net-next 1/2] netdev-genl: Add an XSK attribute to queues
Message-ID: <Z5uoH-RkXNreyU1h@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	sridhar.samudrala@intel.com,
	Donald Hunter <donald.hunter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Mina Almasry <almasrymina@google.com>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Daniel Jurgens <danielj@nvidia.com>,
	open list <linux-kernel@vger.kernel.org>
References: <20250129172431.65773-1-jdamato@fastly.com>
 <20250129172431.65773-2-jdamato@fastly.com>
 <20250129175224.1613aac1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129175224.1613aac1@kernel.org>

On Wed, Jan 29, 2025 at 05:52:24PM -0800, Jakub Kicinski wrote:
> On Wed, 29 Jan 2025 17:24:24 +0000 Joe Damato wrote:
> > Expose a new per-queue attribute, xsk, which indicates that a queue is
> > being used for AF_XDP. Update the documentation to more explicitly state
> > which queue types are linked.
> 
> Let's do the same thing we did for io_uring queues? An empty nest:
> https://lore.kernel.org/all/20250116231704.2402455-6-dw@davidwei.uk/
> 
> At the protocol level nest is both smaller and more flexible.
> It's just 4B with zero length and a "this is a nest" flag.
> We can add attributes to it as we think of things to express.

Thanks for the pointer; will do.
