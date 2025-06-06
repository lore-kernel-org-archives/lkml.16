Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB6A288510
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749215168; cv=none; b=d0vBIxv/AD9F2uxmJQLubk2pt9mv2w7UWd/9Q9z0YAJ83EVKImDUJSGUW1eZacAy8+yj/dyy8nyKQ2vdoyz0i/OiCWnyVetME0wKDY6PrqqZEn/I8p8iPw2iFgnktQcStTA6uoAKg2djnmD3ose7lPRSyKaeZEbz2XDMj0gpBWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749215168; c=relaxed/simple;
	bh=C1GT0Omhkh4mzSLsciQfyAKel4MDNktx3SepqIEgJtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMfyctQMUq+40O1VLQ1ZCKkhL334oT89w4WsHbtifP+tYz6dWK1KnwJyHeBqZcA1zV4CtYRW6Lt30CuF0V2rkFk57MthRLxIixJptMOPTw/ntYg1WoSFvkoVODC1dpwHwKkvLvm1KqvE/+pRxoDEp5Gs9d+xQIF5yX7jg0q12qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M4qAFMN5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M4qAFMN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749215165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5BSoPKdS5u7WoJFLwbKI61wUvIj0zk/QD32Y3X5nyxg=;
	b=M4qAFMN5dXsugBji0ialuGWprlOz4DEpJOWNHd9zuXu1UwjPNNNEYwRQz/BYsMzVB332M1
	JQG2Uxzt/pxBcUvww8cT9fhw5VmPiwpHF6X7mmBYRNrmQurTKSkbB6CMCv+ez3qNmRJM5R
	HJKp86/SnluzoKAicwYp4ArJzLlQpII=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-RD9YvcEVO2elz2Nxid6TVA-1; Fri, 06 Jun 2025 09:06:02 -0400
X-MC-Unique: RD9YvcEVO2elz2Nxid6TVA-1
X-Mimecast-MFC-AGG-ID: RD9YvcEVO2elz2Nxid6TVA_1749215161
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e6f5so497108885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 06:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749215161; x=1749819961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BSoPKdS5u7WoJFLwbKI61wUvIj0zk/QD32Y3X5nyxg=;
        b=WNNsM85L4l8mX2YiGOYT3HlW5Ps/PkzY5Y18Pk4Dy/u6nZgGgLH5imTLTM89Lgvd4i
         gG1aOCo1gGebViyS2Xh3zpcsHyy2i8muR93bdDiMZcw5KIFZBO2671W0uRUd10AftvAU
         UhiFkVSjTUonYW+DJApZloL1iaXas+SK9sUp0rAEXU6GpyP7KWojW6TwLZIBucYFChJT
         M00dNEqiJ0/uXuUSNmpLU2y+l+30Va1JjGhp+Hv2iOOdx87XgewEG4xmGyDITB3jM6Us
         0iNLDpnGqmu+d1+2yKSQ6eEcmrgGz1Tx1XXucGigy2S51M9E1BuvOefkXTkxThODSVFm
         fgig==
X-Gm-Message-State: AOJu0YyLqs7mMF6WusMiqGevBler6kmnjC6m/3N4IGqYgztKbLpV/sAL
	szAGa2eXTAu8wR925tQFkFlzboRRxjjb14HLv5v+bwSo2lTx32UQ829A1+imwil93+4i5NbNQfo
	OkuAU6Nx3+ZKqm0S1eGr0KBCf55i9xOrUpj1A4r6fyg8RXEZIb0OeU5iHEl+BkxCyHw==
X-Gm-Gg: ASbGncuMdIjKXk+YSwGhuefDAuZ7Dd4cXth6ah2HYgfUnfmCk62NO7v5i8AxLFaneK2
	OV+0sc0NTT3J21xhYXQuQczKqE0C1KlgQ3UmXFP0K79QQvGNjXGAW7C6akWeMIyI1dpqXXVG+6k
	rz+YARyZJk5iyxj0f9ooAr4f5fJhN8A1qz5JoOv9oaxHwxvzYoa3l7bXcGWrSHvkfMdeSJ7nt6T
	peVbYED8YhTtsaCgIfY0O3PbTi7s1Xyg47SMVwzu1iAZBhAfV7OizGknlu0u4PzPZhYxBmzQpMw
	oZ/feBElomm9I2SzTCphT0PlJlsCt0v+Y7kQogb1DdUQgrmVGjhLkt8JO4H6qx6I9P8kw5zqjqr
	IPg==
X-Received: by 2002:a05:620a:3955:b0:7c5:a2de:71d3 with SMTP id af79cd13be357-7d22987fd96mr489759085a.20.1749215161512;
        Fri, 06 Jun 2025 06:06:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUdVvO738H51zx3RkpFD2tOGdJQjBekLK/xn3jpyoVqPrtFayMU3gCbklQpppj/190tyxMbg==
X-Received: by 2002:a05:620a:3955:b0:7c5:a2de:71d3 with SMTP id af79cd13be357-7d22987fd96mr489754185a.20.1749215161067;
        Fri, 06 Jun 2025 06:06:01 -0700 (PDT)
Received: from [192.168.1.17] (pool-68-160-160-85.bstnma.fios.verizon.net. [68.160.160.85])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d250e70898sm126377285a.20.2025.06.06.06.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 06:06:00 -0700 (PDT)
Message-ID: <f97a2e18-d672-41b1-ac26-4d1201528ed7@redhat.com>
Date: Fri, 6 Jun 2025 09:05:59 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 59/62] livepatch/klp-build: Introduce klp-build script
 for generating livepatch modules
To: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, live-patching@vger.kernel.org,
 Song Liu <song@kernel.org>, laokz <laokz@foxmail.com>,
 Jiri Kosina <jikos@kernel.org>, Marcos Paulo de Souza <mpdesouza@suse.com>,
 Weinan Liu <wnliu@google.com>, Fazla Mehrab <a.mehrab@bytedance.com>,
 Chen Zhongjin <chenzhongjin@huawei.com>, Puranjay Mohan <puranjay@kernel.org>
References: <cover.1746821544.git.jpoimboe@kernel.org>
 <10ccbeb0f4bcd7d0a10cc9b9bd12fdc4894f83ee.1746821544.git.jpoimboe@kernel.org>
Content-Language: en-US
From: Joe Lawrence <joe.lawrence@redhat.com>
Autocrypt: addr=joe.lawrence@redhat.com; keydata=
 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
 pNzsRQ==
In-Reply-To: <10ccbeb0f4bcd7d0a10cc9b9bd12fdc4894f83ee.1746821544.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> +# Build and post-process livepatch module in $KMOD_DIR
> +build_patch_module() {
> +	local makefile="$KMOD_DIR/Kbuild"
> +	local log="$KMOD_DIR/build.log"
> +	local cflags=()
> +	local files=()
> +	local cmd=()
> +
> +	rm -rf "$KMOD_DIR"
> +	mkdir -p "$KMOD_DIR"
> +
> +	cp -f "$SRC/scripts/livepatch/init.c" "$KMOD_DIR"
> +
> +	echo "obj-m := $NAME.o" > "$makefile"
> +	echo -n "$NAME-y := init.o" >> "$makefile"
> +
> +	find "$DIFF_DIR" -type f -name "*.o" | mapfile -t files
> +	[[ ${#files[@]} -eq 0 ]] && die "no changes detected"
> +
> +	for file in "${files[@]}"; do
> +		local rel_file="${file#"$DIFF_DIR"/}"
> +		local kmod_file="$KMOD_DIR/$rel_file"
> +		local cmd_file
> +
> +		mkdir -p "$(dirname "$kmod_file")"
> +		cp -f "$file" "$kmod_file"
> +
> +		# Tell kbuild this is a prebuilt object
> +		cp -f "$file" "${kmod_file}_shipped"
> +
> +		echo -n " $rel_file" >> "$makefile"
> +
> +		cmd_file="$ORIG_DIR/$(dirname "$rel_file")/.$(basename "$rel_file").cmd"
> +		[[ -e "$cmd_file" ]] && cp -f "$cmd_file" "$(dirname "$kmod_file")"

Hi Josh,

Should the .cmd file copy come from the reference SRC and not original
ORIG directory?

  cmd_file="$SRC/$(dirname "$rel_file")/.$(basename "$rel_file").cmd"

because I don't see any .cmd files in klp-tmp/orig/

FWIW, I only noticed this after backporting the series to
centos-stream-10.  There, I got this build error:

  Building original kernel
  Copying original object files
  Fixing patches
  Building patched kernel
  Copying patched object files
  Diffing objects
  vmlinux.o: changed function: cmdline_proc_show
  Building patch module: livepatch-test.ko
  <...>/klp-tmp/kmod/.vmlinux.o.cmd: No such file or directory
  make[2]: *** [scripts/Makefile.modpost:145:
<...>/klp-tmp/kmod/Module.symvers] Error 1
 make[1]: *** [<...>/Makefile:1936: modpost] Error 2
 make: *** [Makefile:236: __sub-make] Error 2

The above edit worked for both your upstream branch and my downstream
backport.

-- 
Joe

