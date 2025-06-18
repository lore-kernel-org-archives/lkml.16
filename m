Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F35E2F3628
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268279; cv=none; b=BZ+f1YPc7PWcGM6Ay61j/p3//DJFcjjg1lFFMJAmGLqsPKp5RkQkPhdk0fRI6+1fj+rzJdPBzlZszSnPQ1KbmHSqGFwExq614GI+FJO1H5X3VnJY2appcunb8fGlUUZaltXb8+MaiiAde7vCWOwjHuE1k6+ywLvIwP0zJu5OL6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268279; c=relaxed/simple;
	bh=dSwvZmhnUv9vUtgb4j2wEBivI04TNySsv154Cfug3uU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=kYpABeP0YxkWrvmk68LoA8pqQR713VdnXBtkh+gvzEWKTfgHacJM6vokwV5IT5cxnFdSXsbsoipfM3r9aPPNHXaERDxiuTnz45h7na7C/+6MGuMxwWTa0voKO7AhEvjJQ4kR/cUl4OVeHHX2EIpH7gCjWUO8faUvBvw78SPLvxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YjUlKN6o; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YjUlKN6o"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-408d7e2b040so4400820b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750268276; x=1750873076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5aw8HhvYF7rtQGj4otJAqopWyd24EowRxeQggi5V7c=;
        b=YjUlKN6oDJBLEChi4+/FhQ91lDeBD6KEBHoRs+nJHY58W6W5XAIc+97LkUW4gbDmUR
         AFOLlNeiFz5YKdJqQdoU0PqSfVBYTCBh0w9/zNStufnpaIQY4tscbpnMmB6jf/WhwirV
         RzoJHlEYmvucS6H9Y5PlM3kWK5aXhdOBeVz57IRkvOMhLp+Wmmt/R1zbePOHiMV1yXMM
         Q1RdKaRV6NM9m3qyUtLUlgA0xcygdApGUC5PaEOVRq+oTq4v0xvTURJZU5KE6x0sUcYh
         nEai6svPJ0pK77JOOaORUI1swPN+FNwSoQ8fCp/eS7qzKbvqz0TMekDHNTt21zQzmaQl
         ughw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268276; x=1750873076;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5aw8HhvYF7rtQGj4otJAqopWyd24EowRxeQggi5V7c=;
        b=JkChRLAb/9Cm2dj0THUXicD19oigPuB4GJwPtEMcwHpF4NqyJnoi13CD/uyJUNnAzb
         j9VLDUx0ya+wdx9X172vCMw8UPDI1xEzVPyqmZqQRsn4fwWqcQm5DIN1pYbHSrtEG79x
         iHXESozOG9XLX5ALA5dCEJ4jiHveqbZWr5f0MyDNeA0hQ0qkW6zmDPs8j2QkkxfDGuxQ
         X4OaljX2NpfOxPzLPU9MJMKid2oFqV1fl4jJnBzQFeJFNnyCh9hLu+u1x4VQXv1tWgd8
         NAz4KNw+zZCLkZrLRi+zJMGQXqc6IHPESAjSjSn/xIFf2gVV573Y+XLZZWmNFsUO/VLT
         oCSw==
X-Forwarded-Encrypted: i=1; AJvYcCUigGeOdXe3XvJ0kxGAmurDoJuYyZYjiABI2HJGfWBTZ9oGRhZeF+3MmpZBGjt9ZPFm2yJhwMNYNo7+dCE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqcy2Z94bvs58SnaxNrByes/ZNTRdJqFBSraJi58NvZfsHArF8
	Wb4kAmX0nFyCmqzHcUT28ktTExeqS58cO6685MmItZtCyumXK0sT/e5dw2arx0Nk38k=
X-Gm-Gg: ASbGnctTOgk5eFCNSAYMvUbroWT7gwR1bLRCpfMRZs1bx+RfLu3hLrZlujd6jDA29uv
	9jtd7ExiY+EekzfxQh7qUw4tP750XjYYOsSuvrqAve4Zl60QbedG340CqaTsfyOwY2/grNVn17J
	Ru9anXM8K3S+LVZ71/P458TwljV89Mxi5XKVyMBzFN4jY1kHs1FZoBBEEXJxd1It+rB+xbZZciP
	idwI2JFkcIJ/xGAOMuNsQDqTbHvzugUsbtcIQC4xZW36fANq5FXYwJ5mrX7iTT2pDS0MDk7He3R
	AX3SZee4AaeNAox3HmYqm7Vt0z+RiAObwk27xDUHAwegyKx38J4KEYpflsNr+qFEEl6ZFg==
X-Google-Smtp-Source: AGHT+IHJf4DIqbuT4kMFEWquKQMMdw0WGjrkTOtMGLhJHqymSh9M3ASnzaQnXSIrz/mcQrHGd0u47w==
X-Received: by 2002:a05:6808:3024:b0:3f7:e860:b5f3 with SMTP id 5614622812f47-40a7c17047bmr12151301b6e.22.1750268275537;
        Wed, 18 Jun 2025 10:37:55 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a7418b932sm2358659b6e.40.2025.06.18.10.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:37:55 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:37:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ana-Maria Cusco <ana-maria.cusco@analog.com>, jic23@kernel.org,
	lars@metafoo.de, Michael.Hennerich@analog.com,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl, marcelo.schmitt1@gmail.com
Subject: Re: [PATCH v5 02/11] iio: adc: Add basic support for AD4170
Message-ID: <d6ae8122-ff38-4fca-8e02-f27c7ac2ccd8@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48598c0753cccf515addbe85acba3f883ff8f036.1749582679.git.marcelo.schmitt@analog.com>

Hi Marcelo,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Marcelo-Schmitt/dt-bindings-iio-adc-Add-AD4170/20250611-101842
base:   4c6073fec2fee4827fa0dd8a4ab4e6f7bbc05ee6
patch link:    https://lore.kernel.org/r/48598c0753cccf515addbe85acba3f883ff8f036.1749582679.git.marcelo.schmitt%40analog.com
patch subject: [PATCH v5 02/11] iio: adc: Add basic support for AD4170
config: powerpc-randconfig-r072-20250613 (https://download.01.org/0day-ci/archive/20250614/202506140009.GdV0BtKr-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506140009.GdV0BtKr-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad4170.c:1181 ad4170_parse_adc_channel_type() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +1181 drivers/iio/adc/ad4170.c

dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1170  static int ad4170_parse_adc_channel_type(struct device *dev,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1171  					 struct fwnode_handle *child,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1172  					 struct iio_chan_spec *chan)
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1173  {
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1174  	int ret, ret2;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1175  	u32 pins[2];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1176  
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1177  	/* Parse pseudo-differential channel configuration */
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1178  	ret = fwnode_property_read_u32(child, "single-channel", &pins[0]);
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1179  	ret2 = fwnode_property_read_u32(child, "common-mode-channel", &pins[1]);
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1180  	if (!ret && ret2)
dfefd2b2405829 Ana-Maria Cusco 2025-06-10 @1181  		return dev_err_probe(dev, ret,
                                                                                          ^^^
ret is zero, so this returns success.  s/ret/ret2/.

dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1182  			"single-ended channels must define common-mode-channel\n");
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1183  
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1184  	if (!ret && !ret2) {
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1185  		chan->differential = false;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1186  		chan->channel = pins[0];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1187  		chan->channel2 = pins[1];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1188  		return 0;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1189  	}
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1190  	/* Failed to parse pseudo-diff chan props so try diff chan */
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1191  
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1192  	/* Parse differential channel configuration */
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1193  	ret = fwnode_property_read_u32_array(child, "diff-channels", pins,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1194  					     ARRAY_SIZE(pins));
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1195  	if (!ret) {
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1196  		chan->differential = true;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1197  		chan->channel = pins[0];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1198  		chan->channel2 = pins[1];
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1199  		return 0;
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1200  	}
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1201  	return dev_err_probe(dev, ret,
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1202  		"Channel must define one of diff-channels or single-channel.\n");
dfefd2b2405829 Ana-Maria Cusco 2025-06-10  1203  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

