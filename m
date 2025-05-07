Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF434B1E7F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 23:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746660382; cv=none; b=fNS9pEb3H7SegDMYySXiYoCKvFknuvTC5wf1kUoRpvYvaQ3xYGJ5NdwjpihG/gR3GjV9RBsLGDqfTcZZyyYQBjlurq6AJeyZ9Qa2tkDpQZ+M09O6Efj2Pha20F069un5UCuQG5/wjk/tRIYgcRY9MTaRyxwDixwCpMzc2mCHYEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746660382; c=relaxed/simple;
	bh=lu3w6P7LlMUwY8Cp9KmGVgkdFrtFQoSpFx8q4kwWKss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tNn+3Sh5d36NdZc9oRhypXVKatlp3kdnQbccN4V7O8LcYBb6/Tlhvxk1vgr0zqcH28vJdBTLpljKaHPw9fJmsYu+pq6oxPdEVFFRLdLGeXeYVKzkcFPGe1Z8jvGsuzFgDlxZgyISGwzMZwWmbW9w3esu5HqMZmJqyxRv8riRL64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=kt1Z7T47; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="kt1Z7T47"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e4db05fe8so5023985ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 16:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1746660379; x=1747265179; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lu3w6P7LlMUwY8Cp9KmGVgkdFrtFQoSpFx8q4kwWKss=;
        b=kt1Z7T47tzva4qrQ3ZD1rF7ef0VsC6HSHTDjFeVG7joa02f9VZE6pHWUHcQGQTYmKY
         trH6LZi1hJsvVxNertXpAOcA2AeFV6hN0rq4qD7uIYbdOeQPMkKnviv5MN/L5AsWVbtl
         NdS/Pv1sm0e3fmLDKQ+jeMM/ZjX8NtbaNKrTZdZ98advuDb2nWTmXeksl5rFre1+M7Pr
         adwSEFY6ZXzwP9gNbyaAJJo/8dEn03gC0+Cxo4FzMGs+y/fUPdr0EfTSBI5P52e9Bp/L
         zMSS5kqonY0DEPD7KT8Dp+9VJccMEdtILkgBaSjpVXjl0EjBGdsJ7oi9AIx1cxnzRVnd
         PSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746660379; x=1747265179;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lu3w6P7LlMUwY8Cp9KmGVgkdFrtFQoSpFx8q4kwWKss=;
        b=AHG/LpXLJTqwzovNfzRx2fJgs9P6L8/T6YCkzdzcttpkCYs6fqw18qnCSP9R62rWMT
         soWvSJKUSvv+Gi8janyie2vDZ4OLH7xvILrZmY75IVFHCrVjhYwWbTgzjE3id82d3dwg
         YZBVkYzv+jq5Ux9sFYZrfAWap0lGQjYsnCt7Pa6Kst40SEuL8pgQYErMLMGfqFHc/x3g
         aMG7hZTjbH+TGxhERbRJ+TDVlu32OJNMu3K8Kj9rsr+l5jSlUV26YCoTAlUq19FlqTXT
         TonDYVyNhlJlbk1NCs+HrAllfnwg+JrhGtJFDoMctxJ4ZWZXbjsodJ3Qffl8+tkrpuMF
         NRGg==
X-Forwarded-Encrypted: i=1; AJvYcCWWOPTurhdeJtS7GsbuITQvB68QRvT+HH07bEXsueTk6p+tcxEdKV7o9xfZ6BxH6yr8SSXhXScyH2Rv2Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxx/MtH9HSWCLWKTeErJPcVxrYqcuZNRRMTgKN/H7WBKqB8qs9
	qF7T4eqnT+8W0rLN3KS5NpIcsUD4j0/Y9NT+ACCqcWhbdcbHT9X/fUINaAqAseM=
X-Gm-Gg: ASbGncsdsM2jo3tMArG4kLku+d5yimmaaPhowzWrMWAL4s8ZCIzwpbsQQ3pJyUyy3to
	xMLwsQh36ZkOeH5uVy8tKPUQzAOUQPpVZbeXJI66+67Ud0VdOuWElZti4lWTfAsM7VIrPKiagqK
	hNOvhHmrpkgLqpFUqsktS1AAv4gk52Q3sI63E426iKEBl5aMB1VmRCMQ4drXduuJq/IuGrTzQrj
	1JVnotbQE/J7rkjWErqBUcwIic+l6fc5ZszSTHzC2oYMiTi1n4VgFMS8fA11PmwJgFC5x63rZV5
	ySeYYnfys2HS5H82LVJpAfFxBWpaBd5HZfXaTdFqGWbLEa0=
X-Google-Smtp-Source: AGHT+IHBySKvQQUBREV+QQ4TmMCy8WuFlBBAxGTY/ZaA+bqm+UZuBvxYqnEB+yBdmDHfcCPOAdt3DA==
X-Received: by 2002:a17:903:478d:b0:220:e924:99dd with SMTP id d9443c01a7336-22e5ecc52a4mr84664645ad.34.1746660379040;
        Wed, 07 May 2025 16:26:19 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e5d633ccesm26112615ad.228.2025.05.07.16.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:26:18 -0700 (PDT)
Date: Wed, 7 May 2025 16:26:17 -0700
From: Drew Fustini <drew@pdp7.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>
Subject: Add thead clk tree to linux-next
Message-ID: <aBvsGRZqbz11HPwM@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

I'm the maintainer of T-Head SoCs like the TH1520 and I've just created
new branches for T-Head clk patches. Please add these to linux-next:

thead-clk-fixes git https://github.com/pdp7/linux.git#thead-clk-fixes
thead-clk for-next git https://github.com/pdp7/linux.git#thead-clk-for-next

Thanks,
Drew
