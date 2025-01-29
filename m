Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E55D1946A1
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738188300; cv=none; b=KQPGSiAJkOtwRaNZQVGqZmxz9j1HsxYsonSheYHldhSHV4336xVbtkeIBh0J656fQLfkkOHnaqNaiogrH2sHwQATRNjhOeuS9wHsOykmwJ+pEfTVUKtRgn8PHjbFZqvB4lJO6O+vFekI+tWtHEG2XTgrzvmMHBFPgSmTel0/CzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738188300; c=relaxed/simple;
	bh=pgVS+2RVqkeljPXKnoTpwi/V4xHl8AC4iRBb6CPFkMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPVZHnSwAoe0iYDRrIq1SL0SaQIVC/oQALASKe0sT9NfR6iK4IfLJdpoHiKCrfM64lI7yHCzxyWLAknHITa+tcIlVfz+cWfkbr2GNP9ln2a1tSpFHCuWFTUXQfqobxDjSrF6N2t1BgjNSv2qC+m7/736haF9xQyaPt7+TsELl/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zXTAqgVW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zXTAqgVW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2163affd184so16665ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738188298; x=1738793098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=auSdm9fG6SQqLgOEHyJmhNe+uwxMyUkZzDF+skISzAg=;
        b=zXTAqgVWNa44rZhwIgk8k5TbKAsHhF7GEtLb9UK/bp26qFlK6Fw2FCPe/7vcodgB21
         MgjRlL1eFtE/3dmqUrxTiahewA2JNmKyFZjuM2tAWBtv3jSKNCC9eRb2JiyNIYrtK+8R
         3MrzU7upJ9ascKY8kxuBRrc8Y95+zw+iVHzKVs2t+65BHLXNZ3xKLFZvfP12EO/2faoB
         kXu5VOmyDBsjyGMj0mLmp75Ell4ab0fYpvCn9448DPwUa93qh0F5tU9VrGFJk0BORTFI
         CFVCm57ospMCaz+flDwA6FYzYcOKELtszGa/M5skEF9QZlL43O2HRR7/IJJgZvg9xZDt
         cLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738188298; x=1738793098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auSdm9fG6SQqLgOEHyJmhNe+uwxMyUkZzDF+skISzAg=;
        b=gO2r04JjpKwLAwwjXTBztv4ucwtV0yt6JO80BLJ+e8Wk8qQTpGiyoukFVc9bzW8n/M
         kHO3nBeiY6ZK/GQlBNUjLEfZIsfQyKWQzVYTiZosEdb+Cf0YBjzY6/7emaPvx9zYoVvW
         d/KbHSTC3nrlKvwM5phhs5y9HPa2/VdIHjyU0LySHHJA5YuspGrdqxgyuF0b8nWdk47Z
         HbFw6J0c7yv8veZIaKxxjJIeueAkvBRQJjBpZ0UMxsQBGeeFArj3qDby5mtD5CAA8BaU
         ZTX5Kq9eQIRxHPaGlFt58XSJzLjUeTXZu/gqgiLADrFzzQbYKf2m+3KMP1LnzysBWvvO
         DYCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVskKJMqS3NJ94mpSU/tpDdt4I/RNo9VBpqPTYAJoLG3b8Kzwh8C2VhR1FCNbXdMBm5EB+Ws3LfqVQtqCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYH8bNgdpO3RlOLXiv66rkhnPfI18Fk1k0HnBr14OYIH31aHWI
	7MmYCAYlvopo+jQPVfuHGxn4P4uWjxHN9XcmNo0xZJ4vEhSV1vOvKQC6mNOcaw==
X-Gm-Gg: ASbGncsMYbOf3KLAdMvCqPTgyO7rJwfWd7D1JACaylUmPbXovVtUgLiDavvLKIWevBu
	7u74Ch51zUIdGaqNP5O9vlFzBDRVSW6kQGycfiUySc21GdCQCCLWioGUsnQDqlEvlDNRneFBq2D
	G7rmqgVyt1kWsYIH2yR7G+T1qzeSNtvQ0FO4GBCw8qWbwqSHZoDa5dAA1UUn9mhVg8hrcAphkwE
	gYerDV0tJPRYVcsWu3E5VOa38gO8iydI8b4Vh4DOIjn1Oef9VD9OqUvleV7XKcRZ9/bzyHhoBp7
	8KnBid73dKi00S9NUkamYWQNPhVDeUld1ZPpM5stqPulYSO8y1w=
X-Google-Smtp-Source: AGHT+IGAEupXKx0SgR80Zek2UaXseRz4OsaO8ZX/PoFVeYvwYFhxIx+geWC831A7hQ0syi8KM0YqQA==
X-Received: by 2002:a17:902:ef45:b0:216:33a:4b70 with SMTP id d9443c01a7336-21de23a413cmr760805ad.2.1738188297521;
        Wed, 29 Jan 2025 14:04:57 -0800 (PST)
Received: from google.com (55.131.16.34.bc.googleusercontent.com. [34.16.131.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a763468sm12006873b3a.106.2025.01.29.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 14:04:57 -0800 (PST)
Date: Wed, 29 Jan 2025 22:04:53 +0000
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
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 3/8] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <Z5qmBaGE4a7NtaFU@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
 <e52e4ab7bea5b29475d70e164c4b07992afd6033.1737763916.git.yepeilin@google.com>
 <b7de0135f7dcca0485ce9dc853d6ca812c30244b.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7de0135f7dcca0485ce9dc853d6ca812c30244b.camel@gmail.com>

On Tue, Jan 28, 2025 at 04:19:25PM -0800, Eduard Zingerman wrote:
> On Sat, 2025-01-25 at 02:18 +0000, Peilin Ye wrote:
> > Signed-off-by: Peilin Ye <yepeilin@google.com>
> > ---
> 
> I think bpf_jit_supports_insn() in arch/{x86,s390}/net/bpf_jit_comp.c
> need an update, as both would accept BPF_LOAD_ACQ/BPF_STORE_REL at the
> moment.

Got it - I will move is_atomic_load_store() into <linux/bpf.h> for that.

> Acked-by: Eduard Zingerman <eddyz87@gmail.com>

Thanks!

> > +static int check_atomic_load(struct bpf_verifier_env *env, int insn_idx,
> > +			     struct bpf_insn *insn)
> > +{
> > +	struct bpf_reg_state *regs = cur_regs(env);
> > +	int err;
> > +
> > +	err = check_reg_arg(env, insn->src_reg, SRC_OP);
> > +	if (err)
> > +		return err;
> > +
> > +	err = check_reg_arg(env, insn->dst_reg, DST_OP_NO_MARK);
> > +	if (err)
> > +		return err;
> > +
> > +	if (!atomic_ptr_type_ok(env, insn->src_reg, insn)) {
> > +		verbose(env, "BPF_ATOMIC loads from R%d %s is not allowed\n",
> > +			insn->src_reg,
> > +			reg_type_str(env, reg_state(env, insn->src_reg)->type));
> > +		return -EACCES;
> > +	}
> > +
> > +	if (is_arena_reg(env, insn->src_reg)) {
> > +		err = save_aux_ptr_type(env, PTR_TO_ARENA, false);
> > +		if (err)
> > +			return err;
> 
> Nit: this and the next function look very similar to processing of
>      generic load and store in do_check(). Maybe extract that code
>      as an auxiliary function and call it in both places?

Sure, I agree that they look a bit repetitive.

>      The only major difference is is_arena_reg() check guarding
>      save_aux_ptr_type(), but I think it is ok to do save_aux_ptr_type
>      unconditionally. Fwiw, the code would be a bit simpler,
>      just spent half an hour convincing myself that such conditional handling
>      is not an error. Wdyt?

:-O

Thanks a lot for that; would you mind sharing a bit more on how you
reasoned about it (i.e., why is it OK to save_aux_ptr_type()
unconditionally) ?

> > +	}
> > +
> > +	/* Check whether we can read the memory. */
> > +	err = check_mem_access(env, insn_idx, insn->src_reg, insn->off,
> > +			       BPF_SIZE(insn->code), BPF_READ, insn->dst_reg,
> > +			       true, false);
> > +	if (err)
> > +		return err;
> > +
> > +	err = reg_bounds_sanity_check(env, &regs[insn->dst_reg], "atomic_load");
> > +	if (err)
> > +		return err;
> > +	return 0;
> > +}
> > +
> > +static int check_atomic_store(struct bpf_verifier_env *env, int insn_idx,
> > +			      struct bpf_insn *insn)

Thanks,
Peilin Ye

