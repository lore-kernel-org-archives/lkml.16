Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C04205502;
	Tue,  1 Apr 2025 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523306; cv=none; b=sgZuO2pBR+kQ1vx/cCBa6zc15mcCZyrBEPAbW9i0WeO1S2T9ls6oZ1bw4xxJHQjmEzM9IXDSHfpYnpOixtFNQih1EQHyiuNjjzDyFlZXHBwG+qG9ONDQjOPa1IQLbd/DaBRJo+jYpzeGJQCDhp4D0YKLQkjNWvkgeRBsrz0my0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523306; c=relaxed/simple;
	bh=MuRRZEGZNJU69IIYcfqYLPcoUaICLf9YLVUe92/eOtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqbZUha4Ar+PfPGkxmDi7hhmKjGa+Ak2xkxOjqohxVAJnqx+JNLbu4EnUsKBI9bzIKHdBtEBlseokBDMV89fMqKIJ3qUwmDnhevkRo8K/sf3yRYD0W0F/PvyH39kaVIXOFSd9mVtbzkm60dl7KS+vEaiq8nhweR09D/yf8AZxYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGxA4yVx; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGxA4yVx"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso9206973a91.1;
        Tue, 01 Apr 2025 09:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743523304; x=1744128104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WXPNisUWZyL/9rAn+/rxCGRxFeFXNIY+l9dZx1Zl0HY=;
        b=gGxA4yVxl4HDrnGx92Uipuj/gcOUPyWL8VEfchoDKwHhzSEdUV2+WBH8d08YzsHph7
         tf5QQGc37yTXrXjrHBSa6HOmIHqNlKbmJr0oVT9eZDxoBMFnqsZJcU3rguQDPcEFKDsT
         ABZ/C3UsHZOaO7gkjLSjeQYJc7h/F78SaBgXLrA9fmKf5g7rZ7ZtwnUwizRdTU8ffJrr
         tspKvg+j+oqXsAmPqK7nv5pRWJfmyG8XC7ZUBAu4HrQ+OqbK+7DBkWdUtivAKMFlU2it
         h3MyNokN0QdAFcB2eo2Dq2DtKZQjXpuiOkScCrGF6efjxzc1EBjb7eOkgKRBh3WELYup
         XbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523304; x=1744128104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXPNisUWZyL/9rAn+/rxCGRxFeFXNIY+l9dZx1Zl0HY=;
        b=bxwEDlxkjFaT1I86txXl96J3Y5ljBswc9pwnI6Uiu7hlpuzYflvp4tg0sGDjtsoG3W
         ijAcqo36CmevWwnfa5wDoNyWAawNC4auEpF3ongEVt2RlqzJn49jguVEVPS7uMGHRl/d
         AczgU5GaM918+LL+FGKRG/dcvDRcWppEzptYYJlCWVRZ9JFSOx+M4Bqqy0qqQ2BGY60E
         EfYgfd89neWQDVPx/ho/EZgJRIyKZ6GVg+u0Fmc5S9fFYw00HvU/K2UuJwe8T1nRDVlS
         Zzpr3DFFouDs7XQj8KqhKU37gANKrErKPwZaODkR2bRqjIMOL6ZpkgVdNUQ+APD/tnGX
         f2Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUvrw2vY3GX/GGCKIQFJNSbIK8HqHSt+LIvX1DdF0/7QeLEhPfqlaOwNDOohPMJwOwJy4IJ2Pyx9iEOqHk=@vger.kernel.org, AJvYcCVQC6C7bU/eqCkwUIFom321lsrQ4RF8QERQQoCOZN1Y0sT8YxxUwdrBMpDPgwe7tO2MsGIUTkYgjtKi7llkZAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjqVLU63yBiH6az/Po2BnEzwEv1Urg74xFilGKzMfYEvppLWm1
	TgiwCTH/wj5zAs2zMDMggEmGId1DfWha0bl/a7+Md1DS3g7GVBoe
X-Gm-Gg: ASbGncslazhktxgiEzCrau+X9At1qs6Q374t0YT8WL4iLfGXS5u8J/P4nVSpwjHVjKa
	g8ZcWyz9QynMJZLiiFy+/T13p3NA/dK2R8WoMzWOeInBApDh4ZjMGVTlSdWlpjU+3jxnGewHc54
	b7P4GBLtvKP/QI9FDSA1/xu2hRlghPrkIF5qpls9yFELH0iGdbQZhNaNGMTcfomdQFn7gz3+H/3
	6BrQdR1/CfmOgcCh+3vqaO2ogNMupRUJgmGPgnDRI9nWo87Ibg0MOxCbYhOY2GpElJ3yh3tdN3t
	wmPwVGbkfGpEt76orslyc3/gD+tnUu4MNtNsYIzv3E78
X-Google-Smtp-Source: AGHT+IFlvlaXeXbjfKRi5HCSmNsVSow/C0UgKh/PqiSDwiqwdBgUjiiefCJCOKuLqi90rEqvDmVMlA==
X-Received: by 2002:a05:6a20:c88a:b0:1f5:67c2:e3eb with SMTP id adf61e73a8af0-2009f80ff59mr19887753637.41.1743523303961;
        Tue, 01 Apr 2025 09:01:43 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73971091ce4sm9313100b3a.132.2025.04.01.09.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:01:43 -0700 (PDT)
Date: Tue, 1 Apr 2025 12:01:41 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Burak Emir <bqe@google.com>
Subject: Re: [PATCH V3 2/2] MAINTAINERS: Add entry for Rust bitmap API
Message-ID: <Z-wN5TIQP_nuxrnk@thinkpad>
References: <cover.1742296835.git.viresh.kumar@linaro.org>
 <cddb90075c7f892e30f5039c3b3d14e6a239d915.1742296835.git.viresh.kumar@linaro.org>
 <20250401112306.z5krtedzzxphlwez@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401112306.z5krtedzzxphlwez@vireshk-i7>

On Tue, Apr 01, 2025 at 04:53:06PM +0530, Viresh Kumar wrote:
> On 18-03-25, 17:21, Viresh Kumar wrote:
> > Update the MAINTAINERS file to include the Rust abstractions for bitmap
> > API.
> > 
> > Yury has indicated that he does not wish to maintain the Rust code but
> > would like to be listed as a reviewer.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > Reviewed-by: Yury Norov <yury.norov@gmail.com>
> > ---
> >  MAINTAINERS | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 315cff76df29..c55db52590cb 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4026,6 +4026,12 @@ M:	Yury Norov <yury.norov@gmail.com>
> >  S:	Maintained
> >  F:	rust/helpers/cpumask.c
> >  
> > +BITMAP API [RUST]
> > +M:	Viresh Kumar <viresh.kumar@linaro.org> (cpumask)
> > +R:	Yury Norov <yury.norov@gmail.com>
> > +S:	Maintained
> > +F:	rust/kernel/cpumask.rs
> 
> Yury,
> 
> How should I name this section now (since we have separate sections for bitmap
> and cpumask abstractions now in MAINTAINERS) ?
> 
> BITMAP (CPUMASK) API [RUST]
> 
> or something else ?

CPUMASK [RUST] or CPUMASK API [RUST] sounds OK to me.

Thanks,
Yury
