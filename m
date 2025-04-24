Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47230625
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745453170; cv=none; b=pn8Zh30SnYR1hPr3hkFnbOK7ubKuFh4NWd6e++RAio9W7UW8MV2aebvp/cdM8BZAvA1wfmwCXsGap5p6haFRUC+H3bxPVbSy4nJygloBZpzbx89ogW21Unh2F6EU9gkhNmr6nC2/KzD6YcPS5d4cZ1B9s3L3YnwPGk0F5bVgFy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745453170; c=relaxed/simple;
	bh=mVT9IY0iZtItMWBqylUMmJqk8EaUvrBNBHLL55g1PgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aC/Q7H8koNDCu0rmQpqjg7wj7rsbFYL3poa4NKK7W115fiPAWIQCo79jE5Lg5LxOSUUQEeD2Yw2Yoisferfl1rLDKQ8uX1KqxrMBnMG3u5HaktMqkVIVSQyqCoYsFro/7/nmc4LfIYOqwyWr4jCgwBv1fW7ZaEOSXAyDhl1qGFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=Csvn8Oix; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="Csvn8Oix"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2264aefc45dso6321895ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745453168; x=1746057968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A13DmWW4IFyC+2QEpgeShC0monFDWua+5RM+sHVw7DQ=;
        b=Csvn8Oix9SuglDdRamLqqkrPAT+UpkUjKCnbm69tqfbx7QwYZzm9w8ZUH2Wm2lWWrb
         orCaK6Jwi0OIr9NZ/JuPflnM+NsYryiEGrPp8/d3qe801VRlMIZr861Pt3uRsNJBd+RX
         UprO46LrB3CFIrao2EaZrKqJNOSTntikxpZUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745453168; x=1746057968;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A13DmWW4IFyC+2QEpgeShC0monFDWua+5RM+sHVw7DQ=;
        b=JRg0Rry/WsQN/Y7AyXJc2z9xLL4H5zIRxKP0bi58e+0kaRprKZCvXEtTPpeq5NaLHR
         s68GySVZX/JLCT+W2T9BONRDfwMw/vpyZd4SoqYeK/iXOrxtOqI3JZY6vjH8uAgqa6JJ
         GFhIl/rL+d9/thN9fNE6ShlZ6CfzvPnxWHd/GlE1IZIkycPgyN7HxxuJRGGpbcfhYZZ7
         wJHlf7puOayPD4rw9v5XwCjKT3GBMtEPCKy+2cjkU/zi+QO/Vhv+vIiz31uxB9aDjpE6
         MfvX05qHJgqny4elY1/TbB4a7ynVRzKcLQNYBuZZFI0lsCpfT9UhgkTT/YKIWGmZ4F1t
         1qUg==
X-Forwarded-Encrypted: i=1; AJvYcCU48bR5ZQKQQLn4LaPkXurLyKCgvP5dpzlgj2ZKaoxpBlB8CdBCBYi8lgD3YZEknqTulEx9YuqjTXBs1D0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv6cmwkCou59TQCrP+8NcPeCTSJh70ANHmMyBsgWLeKb42UPVZ
	R8W2Snm4THv62We5DSkP88tdzFRqfmgmhGjqGoy7dgIT/HzMhFe0VoxRYqluEfk=
X-Gm-Gg: ASbGnctcTs74GkQ0iWEGpESd0/66iBqBOk+wSJ829u/yNZwf2lVaKYm4hf/QWpk4abj
	5OeLUUd2WmJLHTqH3fyJH44HUqduFe5IId+F/7390l+jcWEH4djz/GQFhae8k/YcKojHGbseDl7
	q9kwLXIW5QZMbczuiTGNLKpHmCBQfckhnMqn2Fo59tbDMUCQX97Xfl8y+6OJ4v2lwGppd4C2oee
	Y1WcwH+8P8xTR1mm500iIvEl0bphv6tZ33N2M/YIkLGq82T+IQoQATH9f7TrFvMK273Tlt1IkTP
	C7Gvv6Q3ri7z5ccepvWlzriCjUTDXN1LxSB1plllsOx91UGlKo77gWRBUhqKfBJH8X2rfsXEtAE
	sPddpGaA0nFAh
X-Google-Smtp-Source: AGHT+IFQXaLcPiac68cSLV4WsHdVRb67rogM0b27Rpkqgk1ad4c1qTHP8Vc1O703UVRXxD05dGwmzg==
X-Received: by 2002:a17:903:1a28:b0:224:13a4:d61e with SMTP id d9443c01a7336-22db3dfbcb8mr6113335ad.51.1745453168527;
        Wed, 23 Apr 2025 17:06:08 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7a1dsm534375ad.140.2025.04.23.17.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 17:06:08 -0700 (PDT)
Date: Wed, 23 Apr 2025 17:06:05 -0700
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, shaw.leon@gmail.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Shuah Khan <shuah@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	"open list:XDP (eXpress Data Path):Keyword:(?:b|_)xdp(?:b|_)" <bpf@vger.kernel.org>
Subject: Re: [PATCH net-next v3 3/3] selftests: drv-net: Test that NAPI ID is
 non-zero
Message-ID: <aAmAbcbLMl6IBwpd@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	pabeni@redhat.com, shaw.leon@gmail.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Shuah Khan <shuah@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	"open list:XDP (eXpress Data Path):Keyword:(?:b|_)xdp(?:b|_)" <bpf@vger.kernel.org>
References: <20250418013719.12094-1-jdamato@fastly.com>
 <20250418013719.12094-4-jdamato@fastly.com>
 <20250423161612.3dc2923e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423161612.3dc2923e@kernel.org>

On Wed, Apr 23, 2025 at 04:16:12PM -0700, Jakub Kicinski wrote:
> On Fri, 18 Apr 2025 01:37:05 +0000 Joe Damato wrote:
> > +    bin_remote = cfg.remote.deploy(cfg.test_dir / "napi_id_helper")
> > +    listen_cmd = f"{bin_remote} {cfg.addr_v['4']} {port}"
> > +
> > +    with bkg(listen_cmd, ksft_wait=3) as server:
> 
> Sorry, not sure how I misread v2 but you are running the helper locally.
> So you don't have to deploy it to the remote machine :(

OK I can remove that and fix the macro guard for the v4.

> BTW does removing the ksft_wait() from the binary work? Or does it
> cause trouble? Don't think we need to wait for anything in this case.
> With the XSK test we had to wait for the test to do the inspection
> before we unbound. Here once we get the connection we can just exit, no?

I agree that we can just exit, but removing the wait breaks ksft
utils:

# Exception| Traceback (most recent call last):
# Exception|   File "/home/jdamato/code/net-next/tools/testing/selftests/net/lib/py/ksft.py", line 223, in ksft_run
# Exception|     case(*args)
# Exception|   File "/home/jdamato/code/net-next/./tools/testing/selftests/drivers/net/napi_id.py", line 13, in test_napi_id
# Exception|     with bkg(listen_cmd, ksft_wait=3) as server:
# Exception|   File "/home/jdamato/code/net-next/tools/testing/selftests/net/lib/py/utils.py", line 130, in __exit__
# Exception|     return self.process(terminate=self.terminate, fail=self.check_fail)
# Exception|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# Exception|   File "/home/jdamato/code/net-next/tools/testing/selftests/net/lib/py/utils.py", line 78, in process
# Exception|     os.write(self.ksft_term_fd, b"1")
# Exception| BrokenPipeError: [Errno 32] Broken pipe

LMK how you'd like me to proceed ?

I'm thinking:
  - Leave ksft_wait()
  - macro guard
  - don't deploy helper to remote machine
