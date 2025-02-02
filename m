Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D581420DD
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738514239; cv=none; b=E9tBhOjnOy76MFXhENAjch7C9U0gOpLUcprJCMkXju3CjmQv0sDDdAxMbuInoKBubgSsAtV1F7+wrdaD4KZNxyVqsoDlSneOF98z/DvWZ5kPfSP/Wb3wjO6DVSwTOJHcT41G2C8NnyLmkvs2HJ86jQA+i0Ym3O6ieNOHZ8XWmMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738514239; c=relaxed/simple;
	bh=/tB14NYSaijoYPS4FpgJhdnq0Z4fpHgkv9sBwwcg6Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V4vB+qBqJZ+14KiK7CshM1r5VhXncEKysCaG71bvsBCeyIM0bNxAXWQ400mffd7fhV2G7dEb/075a23moOLuHeGyCfA1FbSCdgBKaqeAxPB1BsMmtlkusNcKHiZpTNZfkebHCIk7YqpO30xu32wOqq2563rihWto7HwRn4T4sBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=suQWK/lW; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="suQWK/lW"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-386329da1d9so1689495f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 08:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738514235; x=1739119035; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CBWlyemdwPgaC+YBkzTyPHD8l2slGEd6uAbpuUvQE1Q=;
        b=suQWK/lWS8EkAUnFdu56SBgNejWkvzaQlYs5MrhRWsYNX5WlWybDjgNSG19GAwqmOJ
         R7Q6ZrOhLVAzpANpdrp+nA2V2titmd5RXr2G0RsJfOTgJ7gW1XKNdtk6hHtCFCNcniJv
         8rKMVSOi6LpQtZN6ys/c9LyUFCsnbkNOziMpF3daMQTTnDLnIlba9H2Ecno5zY8+oDwl
         kauBWSkaC/O4OYTESzaAG6D3gT4FI1vCWbuvJIHc/JwVgAyGIf/adGAWo7+iPXWJsO3c
         JHzGcKd5EN/2ycWLGRI0PzwXWhw9t5xJm4/YO+cwJ/au+bXm3Z4hLOfKNNxd1zILbWJN
         nmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738514235; x=1739119035;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CBWlyemdwPgaC+YBkzTyPHD8l2slGEd6uAbpuUvQE1Q=;
        b=puak7ICA9R8ml2g50l2MxZ58RP9bQMZif0iBhEKV4IPLxqK/Zan5XiUk+QUscM9xI2
         3D3VFSpqs33Tr1n6cSmN37FdWtTebyu61C0Y3xGv5mwtVnLEp8/b0hv844N9RT8rxE+2
         4fL35NkqN7a1PpP+4+iFC66rirzjpbOo4kv5E3mgWyRItanmU164F2utqa8+h+QnSmUI
         CUw8Jjn1JD5ivnMjCtfJLvyG50kwBkM3yJ2sTdX2wtv5fiz16gvMi2evoUDgh8ILX5Am
         c1MDcHzPI2xmfnUCMXuge0ZlMU6ouwUH859yyy0+QjP/z065/FbYEnsGsSJSvPvdwV9C
         +R8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1C8mMegz2XZx6t2PbNSlUThEIWQFuo+hgy+zW85fyrwiwYbOnXBtlGKVNzGLfrAsx8YpssMnnVY8xQgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFlqmCVZUSyyxtGo7QaRk1OMdutZ2OC/Me/JaitNV3/RiuWmh1
	lmoyH68noXh1Ij8Nrv9kUkUId+O0r/+yhuQthuKYseRDqpM4IkCTD6Dax7H2nSA=
X-Gm-Gg: ASbGncuCL2erqUlSUrPtyqxnr4UJbzxKl3F4juqE5eiBhYW30h8b7qeUFR//eQ5hutC
	FxF0vTINfvT0BDB1LhBS5qTrbNKGjGEfasi1gt8x288D2I3gWfh5rizoa8vEiCQ6vKL/U5Obldp
	EaQCqPiiVPGudm8cqjhXPEfJz+KVHLqDdGfZ5DyLHx9oiuvakCwRIxOTwnSHVcWR8X+3UWt+Ek0
	ImEDXbT5huL5tX50ohZXN8pbDdSnDKrplWF1RcK/36FhravNCZwMRXXv6SRkwiIMSKvIpDuyBGR
	S1lRonlq9v4o34SxeCbL
X-Google-Smtp-Source: AGHT+IGuBjGwVOPU6+tME45kmJSnYYMMbOMr8+kiXx1JopFuZmaiZ2lyYW3NrXBUZr3BaYEo+CRQIQ==
X-Received: by 2002:a05:6000:1565:b0:386:366d:5d03 with SMTP id ffacd0b85a97d-38c5195ff67mr18272464f8f.16.1738514235219;
        Sun, 02 Feb 2025 08:37:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c0ec7f1sm10196662f8f.9.2025.02.02.08.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 08:37:14 -0800 (PST)
Date: Sun, 2 Feb 2025 19:37:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Frank Rowand <frowand.list@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: drivers/of/unittest.c:1195 of_unittest_reg() error: uninitialized
 symbol 'addr'.
Message-ID: <f2f5df88-a4bd-4460-bea3-0e1717e7e1bb@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a86bf2283d2c9769205407e2b54777c03d012939
commit: 7b937cc243e5b1df8780a0aa743ce800df6c68d1 of: Create of_root if no dtb provided by firmware
config: sparc64-randconfig-r073-20250202 (https://download.01.org/0day-ci/archive/20250202/202502022102.D4ESrh5e-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502022102.D4ESrh5e-lkp@intel.com/

New smatch warnings:
drivers/of/unittest.c:1195 of_unittest_reg() error: uninitialized symbol 'addr'.

vim +/addr +1195 drivers/of/unittest.c

ff61bacd77f258 Rob Herring 2023-03-28  1180  static void __init of_unittest_reg(void)
ff61bacd77f258 Rob Herring 2023-03-28  1181  {
ff61bacd77f258 Rob Herring 2023-03-28  1182  	struct device_node *np;
ff61bacd77f258 Rob Herring 2023-03-28  1183  	int ret;
ff61bacd77f258 Rob Herring 2023-03-28  1184  	u64 addr, size;
ff61bacd77f258 Rob Herring 2023-03-28  1185  
ff61bacd77f258 Rob Herring 2023-03-28  1186  	np = of_find_node_by_path("/testcase-data/address-tests/bus@80000000/device@1000");
ff61bacd77f258 Rob Herring 2023-03-28  1187  	if (!np) {
ff61bacd77f258 Rob Herring 2023-03-28  1188  		pr_err("missing testcase data\n");
ff61bacd77f258 Rob Herring 2023-03-28  1189  		return;
ff61bacd77f258 Rob Herring 2023-03-28  1190  	}
ff61bacd77f258 Rob Herring 2023-03-28  1191  
ff61bacd77f258 Rob Herring 2023-03-28  1192  	ret = of_property_read_reg(np, 0, &addr, &size);
ff61bacd77f258 Rob Herring 2023-03-28  1193  	unittest(!ret, "of_property_read_reg(%pOF) returned error %d\n",
ff61bacd77f258 Rob Herring 2023-03-28  1194  		np, ret);

unittest() just prints pass/fail.

ff61bacd77f258 Rob Herring 2023-03-28 @1195  	unittest(addr == 0x1000, "of_property_read_reg(%pOF) untranslated address (%llx) incorrect\n",
                                                         ^^^^^^^^^^^^^^
uninitialized but harmless

ff61bacd77f258 Rob Herring 2023-03-28  1196  		np, addr);
ff61bacd77f258 Rob Herring 2023-03-28  1197  
ff61bacd77f258 Rob Herring 2023-03-28  1198  	of_node_put(np);
ff61bacd77f258 Rob Herring 2023-03-28  1199  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

