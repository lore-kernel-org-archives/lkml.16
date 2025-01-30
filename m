Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F262581
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 00:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738195390; cv=none; b=fPVVkUwQKHgTkanz2DHzOtBHYB+JsBGA894v2DZRHeO+CRN6WaNvtHG92m+0VBnLsAfPy+avZqSfnM9qUo97YFv4r9nvWYrLS4F/G89ih0fhDv9jnECC/ejakwwX2ouL1j8qyZH3VM/uxgd8V3PBNo7s7hMpGT5wtF2jZDHYOlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738195390; c=relaxed/simple;
	bh=Sj+Xftkj+qlU0BJkHbd30+qFOwtKIfmhoQgIOQHpgUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qD8zQ1gr0fVaM+oiGfVyadw26E4Bx9zVuWcQGdgWRs0DVyIZe86VrGPbsjMwI+Sim1Q1jqB/0r8/YwjidIuEPgjmLUMdgAlCaLMK2EL0VYp/BOTVyASzKQENNYqKhNO8pULTRHfw0JS0TdGQex7ijOXVyGA/N9a8wC9rqHcxZ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YPvEluGN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YPvEluGN"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2163affd184so31285ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 16:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738195388; x=1738800188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s/sWxNAPnxEZbenKOf7N+j5g5zHNpFBMXZn1jjqHCpE=;
        b=YPvEluGNgyFZPEEjR70NUgr6F8+rXep+nPfIJUmbXr8s0VwoEKbQIBg5PvdfGN2Plp
         dMxEu7Pasf3JHqG0bTQi21iiNH/4klD0turhBl4E34BpBlCuxOvacqA37hfF/eTZDQFR
         8llJS176B7SKQd1j7kwKR57hUNB50wTzVX/nLIhPMQWJr5BiEO3fWujd64fovw4UiAq2
         IQUKZVwe/BovKE2WvBaS7UoZcsbzXunY+GPjas4e2IWIAdBAyUymLU4ZnW20ZvIeh2lY
         6rUqolYMD36OllrH1vj44NnnPHmPrturxiLPV8vJBrMS8loA0vsso5JvO/HaX18SlAWn
         mz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738195388; x=1738800188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/sWxNAPnxEZbenKOf7N+j5g5zHNpFBMXZn1jjqHCpE=;
        b=c6oTCdlVramOOxOIUBRL7gzy4A8bbavvmt3lAt/uTkUip3UR/u3jO9KuO+umuJiqEN
         5uOopZXc0UrF+5dB2Iii8THB4G5QzVowoWfgZgWyFsFyPrdjWONtXINypAKOC6qT4mPf
         QQBD5Z59TRqNDYf3/Bmq5PlVHk+SNddKtwD8+4Y7+dt7okv+oUeum6SbsvtexfmQFJso
         lHYzIv3ZkZNsNTDdPc1qfshbLw3CE+BY5wX2Q6pDPzFo+OKDqRhiyaW80VPd4Nsr0EB2
         JF5j8UrV10Tom+H2yquhgxeNEfrJY4ahUfmLNgYWD4QWXLdk3QYUkihpnBiitXGSGhMb
         w7mA==
X-Forwarded-Encrypted: i=1; AJvYcCV437PfMQPZofpY4haxBYMMunu7dz9hU90iIFO/L3Zs1NqY9icWYArCr8jyZV3xmJvvzMw2tOfYzCM2cow=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb51OX53sSb/1PzwAmti+PySSbK6w76NEEqeoT3zKSqGNWQ3sm
	J9txzJSRnM/SypwaJp1x9Tqd2DJqSfQpw5PjP0Ty9xDKZv1zpR2Vc3tFsep4yg==
X-Gm-Gg: ASbGncusLndC12FovWHrLhajBc6vHdqLYeMP2gYMYA1pYwypDItWFdgEMgzPw9YqOdt
	68WOm+jRMYYtLYK1VBJmDM07vVRRGpVwkU2oMJGSOPtU2R6iHMsWFG5uZqZTUJhgcscUNGiPRjz
	HEntJD2V06Gn9F1xzlxN4Cg4hg4RhktH9PoKfLLbiHuSTiTWu+YF0AnB3CTGrW0Yo7mLybX+XqF
	Y2XX/pxQ1o8btp6Yrj38MmB5BdQGJDor73V050VK4iVzyH8DNslisBDHYxyfqpPb+s8Vo2Ze2Ga
	0J5wLXsm7/rFo4+W5JIlQfIdfX9p2gpZy31UVsTQIoimzm1x9yE=
X-Google-Smtp-Source: AGHT+IE/F0VzN3ET6T5NQ93cCyrPvlKbgWQX6l9EQyxxToYjZ5gVa1o2Iroc9xQVHfCVOmJeGyKC/g==
X-Received: by 2002:a17:902:7447:b0:21a:5501:9d3 with SMTP id d9443c01a7336-21de36ce371mr481865ad.21.1738195387986;
        Wed, 29 Jan 2025 16:03:07 -0800 (PST)
Received: from google.com (55.131.16.34.bc.googleusercontent.com. [34.16.131.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bccc8a5sm2405786a91.17.2025.01.29.16.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 16:03:07 -0800 (PST)
Date: Thu, 30 Jan 2025 00:03:03 +0000
From: Peilin Ye <yepeilin@google.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bpf@ietf.org,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	David Vernet <void@manifault.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org,
	Ihor Solodrai <ihor.solodrai@linux.dev>
Subject: Re: [PATCH bpf-next v1 7/8] selftests/bpf: Add selftests for
 load-acquire and store-release instructions
Message-ID: <Z5rBtxNnGHjJaZEt@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
 <3f2de7c6e5d2def7bdfb091347c1dacea0915974.1737763916.git.yepeilin@google.com>
 <131a817f7f2749e78e527a251ca7971588cf62f8.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <131a817f7f2749e78e527a251ca7971588cf62f8.camel@gmail.com>

On Tue, Jan 28, 2025 at 05:06:03PM -0800, Eduard Zingerman wrote:
> On Sat, 2025-01-25 at 02:19 +0000, Peilin Ye wrote:
> > All new tests depend on the pre-defined __BPF_FEATURE_LOAD_ACQ_STORE_REL
> > feature macro, which implies -mcpu>=v4.
> 
> This restriction would mean that tests are skipped on BPF CI, as it
> currently runs using llvm 17 and 18. Instead, I suggest using some
> macro hiding an inline assembly as below:
> 
> 	asm volatile (".8byte %[insn];"
> 	              :
> 	              : [insn]"i"(*(long *)&(BPF_RAW_INSN(...)))
> 	              : /* correct clobbers here */);
> 
> See the usage of the __imm_insn() macro in the test suite.

I see, I'll do this in v2.

> Also, "BPF_ATOMIC loads from R%d %s is not allowed\n" and
>       "BPF_ATOMIC stores into R%d %s is not allowed\n"
> situations are not tested.

Thanks!

> > --- a/tools/testing/selftests/bpf/prog_tests/atomics.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/atomics.c
> > @@ -162,6 +162,56 @@ static void test_xchg(struct atomics_lskel *skel)
> >  	ASSERT_EQ(skel->bss->xchg32_result, 1, "xchg32_result");
> >  }
> 
> Nit: Given the tests in verifier_load_acquire.c and verifier_store_release.c
>      that use __retval annotation, are these tests really necessary?
>      (assuming that verifier_store_release.c tests are modified to read
>       stored location into r0 before exit).
> 
> > +static void test_load_acquire(struct atomics_lskel *skel)

Ah, right.  I'll drop them and modify verifier_store_release.c
accordingly.

> > --- a/tools/testing/selftests/bpf/progs/arena_atomics.c
> > +++ b/tools/testing/selftests/bpf/progs/arena_atomics.c
> [...]
> 
> > +SEC("raw_tp/sys_enter")
> > +int load_acquire(const void *ctx)
> > +{
> > +	if (pid != (bpf_get_current_pid_tgid() >> 32))
> > +		return 0;
> 
> Nit: This check is not needed, since bpf_prog_test_run_opts() is used
>      to run the tests.

Got it!

Thanks,
Peilin Ye

