Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A691C1F22
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746170185; cv=none; b=uAL/RwCg28/lfF8EbAclYvmPZM5WVfTkDWZYGGnn7+rQo0039DaNqO7gGTv0svNQuEK1cYXK76Z42ubFS5LJBl3FHjSRDh6LyaN4rgmg3fbR8FV94lXaloNOQ5qd4xj5DawzozWCS0dp03/FyiSfW6Kn38jwQgfB6o/lcNJXtVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746170185; c=relaxed/simple;
	bh=TEn8q9fQLQPZ4XryW0ZjyzXlzHST0D5QNErlYACy7d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpVw/wx7DARxpS4I0lDQ5STWXLUpRhJx0GAToad1uMrXU1fO0eu0tfFkSQ51RvZjO61uBLAXGxmSrfRJq36kSUrIVbobH6NCqraIPbGG9bk3Zi4wFlFATWRbC7VEwQlwr0B607GA7RNEXK7ABeb3QyVbWs00Trdvi0nAPHyGRYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p93Z/XUq; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p93Z/XUq"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-391342fc0b5so867971f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 00:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746170182; x=1746774982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gBU2uNDQCYbDHEbrbUInGkBBuJpJ+ziGBCavc7pVcyw=;
        b=p93Z/XUqkF/YrOt/4s6eZl+EJFwalWPRNvSlc0avihC+zctbc4xw2LKHGdFEldaYCl
         TmSO96tV1MTNTYA6UwIrm1cz0ZVSs8VjQMnC7PWkt0YyAN1dswn/92VRR+vPxqxZ8Alt
         98mNqX77Iwl0lc3b++O6AuR3ptnspHBC42SjOY/wgD4I8KmWNAXD0OchZ8XZgOhLyJgD
         uOPY7o2nqam4K1gUZPvBIJe0nZYHpCUqm0GQqXDsYq8osbnCtddmrM50Hfs6CWhV1vdj
         qwEe0X0RYOgFYP4C+xmVoSW1q2hh+FJAouxz6yJOpQtRWuBCWQLx7gxVV0bujqOKy49C
         C53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746170182; x=1746774982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBU2uNDQCYbDHEbrbUInGkBBuJpJ+ziGBCavc7pVcyw=;
        b=FxT4/PBH77PppEc8EL0E5qK+v9Fuv6/G/CzXGOVsBexCWw8PazbGsxfUmKHni/bekO
         9q95cIIjpe4zB6SX3Pc35UE8aHBDTx6nJjzPS9z3akBgLe0UTyFKTXKuMK3lQmRzC35d
         Fj0os90YjLtZBxsUAU4+9zyp0J8NLYxpJJdVHHrF4tDpVVHKAs799au47VyXqT1ArZ/3
         NWWZ2QkJYYw9ZBANJ/K0cpvf9bXyDaISEOfP32P3th3kRDXoGGIBxXkZ5n0wsGjM6iVr
         xvTBpulgAJL7YDt/Ms477cu3A0bdXr0UjXAe/0ViPG9iLSwH/CGhsrTO0n2KlrQh6POZ
         6PkA==
X-Forwarded-Encrypted: i=1; AJvYcCUiAFOcl5ZiegSzSi8NYmbmqS6f1wdA5CwCfRxNwzpEwt4KfhCiKS04ekuIyDbZ+Zc8rPQUbqfDsQAwQMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxc4xlMc9BbiXKHYW3qNbhbwEztqb6EHlD4AehdYdptcAiwV6N
	l2p+1p0+ZvYnMwL364QVlo58kwKj0sFT9+2NO5siK2swIctaQnoRtxq0IH355BA=
X-Gm-Gg: ASbGncuP8Gl6aK6We4aNa3EoObGJa/nJ6M0Zpx5CarL0ZBjqxEkPrZT+3c4kT+qcBg/
	JnhqLYFbz9jF6lGSOy9bq22bIp5JraIA92V5jBRBzggR1EiQ9b4h3wJ0Uynl/XZmQF5ii/Knhdu
	vQ9BlynCvMDyBzbLrtMuvdwsElV4Vd9aB5A/iCN2WpJfNCBdfsXyCeaSi54LUZl6+5JpBnB6tyz
	udF5ACh01vRKpjJLuc6XOBl6Eaq5HNLLz1DE7M3GxUOiIGZcppruMmrYVvJpYay6qGz/aBYjAhw
	D8gW+0YXkDTJ6/Fyi8x0uVAb1xAJRf6hlMb8LLsHO4kVJA==
X-Google-Smtp-Source: AGHT+IGoljjX2Mq++EkXquUoZWnI1wA/aHixjMFIJrg5drkNpGswC9dHeERArqW4lNSPCvTr79mfoA==
X-Received: by 2002:a05:6000:4205:b0:39e:db6a:4744 with SMTP id ffacd0b85a97d-3a099addb5dmr1039941f8f.32.1746170181783;
        Fri, 02 May 2025 00:16:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b170d0sm1308789f8f.99.2025.05.02.00.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:16:21 -0700 (PDT)
Date: Fri, 2 May 2025 10:16:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: Re: [PATCH 1/8] Staging: gpib: agilent_82357a: changing return type
 void in int
Message-ID: <aBRxQhLxs13zuFZy@stanley.mountain>
References: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
 <e902b9d53283d350e6f97399dd3fea646fdb5d88.1746133676.git.thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e902b9d53283d350e6f97399dd3fea646fdb5d88.1746133676.git.thomas.andreatta2000@gmail.com>

This patch will break the build.  Also you need to work against
linux-next.  Dave Penkler already did this work.

regards,
dan carpenter

