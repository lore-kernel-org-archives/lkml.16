Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB321E990E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838223; cv=none; b=cI0SqLZ8p7cLreJzBxudVBEEojl+o3Ka5kWfjiXwZ9y/e0Do8QduMdqXzvtKLpn+GfgEJDdwPHmlp/bMScopCikVAlu59GmgnmysQtXtVXT3YImKWtRId/fUEwJLQBdvML2pByPqLrINlW6wkCSoEHQzzgU+vOVLaL9jP03mBdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838223; c=relaxed/simple;
	bh=D1ukx6IEbt7m5e1eN5ttne+LtpSF3fF6q7Kc23KbV3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZvJfvdyyKxlGT87sdo+K2k9hyQwIGvk3c6V820tE7v08r8nENPsyXekd0ddq2B+2N10eFSq6UsQL9+cColk2vi27jgsc6Qf4fbrhRzgEL/Ho1pYszieluWyBJMDchHTvPb18Fn3eyMx9yiQttCXMn6pyCSevgtwpBLToqNxxHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+MksXt6; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+MksXt6"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso122412566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750838220; x=1751443020; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+Pab/SEmejSqMLBiWYRVdUqftoymobeEYJ9CJ98TDo=;
        b=D+MksXt6Yro9IVzDZ0+VLWLYL21NOCBSKNpAAGen5StWjeXkkOro61YCvmgv9V5qzM
         Sw735VpikgdJHG0QOMocEH0fZBVBZyQyXCADJXodG22AbgYxynHuPZY9xd1LvhkaohOm
         +cSGUxFnerZpJoY188AjXFg8Et4ngG+Ll3nWJuFPegBr/DTPxH/rYS6BfSI2yaplUJEs
         JVjIn2Pt6CFnyMcTWrY952wsGs+PCbi4iOI5Z/Cmj1LgtvYVLw3uqKdFHuixPNnMroIY
         smmkuLm5jfHfWutfdLZ3hvDAkk+N3FZTiGqjRgDMkUWnjNH92uLsJh92QAnLiMkT102e
         TyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750838220; x=1751443020;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m+Pab/SEmejSqMLBiWYRVdUqftoymobeEYJ9CJ98TDo=;
        b=hhXbTVDbieZOGRip1p/veuECxXAbUh77+mlDbP4WMbHgpnaR1Vo9oahGuLgQcZ/aQe
         EIP34Z2GU1HWzZnQEh/yD2MqBIdTWNUlxS2hV6VAb7pNusg2ZpGLzuDUcub+KOEiQVvk
         Cq4u+tqxKvsxf+Sd4fvPY7gyCA10e/KBQNAIeoA73lKH8j9VfwIhjsujzplKH86f4YUs
         dk7L6MmmcT5zjpYbKz+2m200hkb3KsW5zZv7ihZ8b2OEJVhtpB8iIudncigXyKsekpuW
         tAyNB012L2eJgZCVddqBpGXoixm+RRu0+abZcuD4SZib6Po709WuN4XF9coA9TsvgwNT
         YANA==
X-Forwarded-Encrypted: i=1; AJvYcCVSioCdomT3CRw+tOJ9fSzsp6x6vx+GxeWbDjWlG+DzzB83LkXCYzqwocEwaggCzrjYN5OM2GliVTYGMp0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9XWHjqFCfqaZInTfgkHfog+CAJZcEPWoXqy1IKcPL/5E2Mylr
	BU30a0tPrJ2SdhKEZvd5MEtLHkM3wM1JmFO9+AWVjuxia8bSqduwwoia
X-Gm-Gg: ASbGncs3A1pnTX4uVMBrxssHadpnQk0i81l9o+UBlRwck86PSIk0mmCYdvk9ndo3vpY
	7Vl5m8qWEr/CzabDUjr087tLvShskUW/JO+K+/gCobymwcdSEi1Zx9Hx9Dmvtawx01SMqnsxCn6
	+aXfD+hM/U6p2mIF/xex0oOxPW0HS53qHupNAREJ9Tb+te1+E+j65tSzWl3yP27lPQNlw6dcK2c
	j3oM51EA/yGtZ0YP1YpJgLA5ODCELMcyWzXSjDAGh1F1nKjZnPHromotuhk4jolPZ7U6+fU9RRL
	0AoS9uwFFzxZLvBX27xZPh4MVea9Ppzu2pKW89jfjs4jbkvz5IcPabl0za7uOg==
X-Google-Smtp-Source: AGHT+IGn0sWSVSShlAdAL9yogqFRDh3qcz8v2lyvmzk74wnvYtwNcTBYe+K1wMvbdYx55TBHpeXAtA==
X-Received: by 2002:a17:907:c1c:b0:aca:95eb:12e with SMTP id a640c23a62f3a-ae0c082c6a9mr148549066b.24.1750838220398;
        Wed, 25 Jun 2025 00:57:00 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054080e28sm1004169266b.73.2025.06.25.00.56.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Jun 2025 00:57:00 -0700 (PDT)
Date: Wed, 25 Jun 2025 07:56:59 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com,
	richard.weiyang@gmail.com, maple-tree@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] maple tree: Use goto label to simplify code
Message-ID: <20250625075659.gricak3viwlviam7@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250624080748.4855-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624080748.4855-1-dev.jain@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Tue, Jun 24, 2025 at 01:37:48PM +0530, Dev Jain wrote:
>Use the underflow goto label to set the status to ma_underflow and return
>NULL, as is being done elsewhere.
>
>Signed-off-by: Dev Jain <dev.jain@arm.com>

LGTM, thanks :-)

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
