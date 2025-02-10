Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023181F4628
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739209244; cv=none; b=rWEa202Be7HKQFppg6ciDLylat/bG0ODMuZjkTQYLH7eo5k4lhIZxdGsQRpHby29uE77te99QI/P7c9Qe+bnqth26DGuPBDO7/k8sKrkN2gp3MqeH22BxlN2sDeg8tX4w98flSa9uK+I2rF2fsSUROlsiqHLoxNb0FfcUqqq0xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739209244; c=relaxed/simple;
	bh=GllUjlRIabu873JIWzTgNfU0p20pXbuqom0PPTm22Hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rIGCydRiNMxmInf4lFJ7W1i5lx2M1zTZupmBAf4wWOAgEZ9DDnvhVezgQVxPLBxPGFHQRcZPgVvxiS+xK1daKqYzq1ZGkubxxppRCurHtfNp4bWbIS2zllobAm/MVzcvs3xRRQjPHbPpcS4nOMJPqPgUpQtvOwkmK6lCJv5Z1FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0vcSns0e; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0vcSns0e"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-47190a013d4so311361cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739209242; x=1739814042; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GllUjlRIabu873JIWzTgNfU0p20pXbuqom0PPTm22Hk=;
        b=0vcSns0eqJiIfGM3K5ANNlpUYQ744YvgVMzza6r+lioXqerYpu4zeoa4Z0PU3hJtFS
         7qFKzLrXfA4bJRBmlzkrxgJR1rO+x0O+sOGximkPLr2Drp8zcwwVxBU18RpisDD71Moe
         1XVjOnhl9U+d8fR/RRqnJ32raFnExYvGWmmU14ARjtSFMjO4h3/LOJ+2Dfh49CSiMU2a
         mr/Q2kkZAV1xn8woYetwAzoZbuiNtLB2C1AAADogkyeK8JKF+mXgHoy5KRHD9NoretUA
         O0ZD24O7ifg8KA91Ykmv3s9X+4ej8+UyjxusYcKgHPU57E7qqvg1im6pCGV5KCs8w5Tx
         JDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739209242; x=1739814042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GllUjlRIabu873JIWzTgNfU0p20pXbuqom0PPTm22Hk=;
        b=c3sOP9q+KHil9rh/qhrOzH2SOLZ1NJcXuAFeV/pUrOzLDO/lcki9AUU4/TPvk4r8yg
         BW7XASCg8PAJjfHywT5tTgCzTheI/dMweGQQpEJaoc0kHpjw9FLUNSIk4BuhtXX5SHp0
         MSJYfqXmkHCoy8LXjTis8rO5oqr5hRmYHmSGS8QE8PFS1f6teWXvyphvTaPTMBJYTfvA
         MwVYXIVpVPI3L8aJZgUKT7hpUYuRmi4f/ymZMzQwpd8ucgMJNCxphgHjo+Lg/9ZcAgI2
         MVSj0ADPmPT/yJHk0M0bBtr96ceYKzKOatvaLw2hjhx6zubqgBV8wkB22szOjM8VelN3
         dTAw==
X-Forwarded-Encrypted: i=1; AJvYcCVLmoA3aKtkYKZdTYX+s1lnlF/7fuiaCCLn3LOB5w8wC2R+K9vHfhzXwxKnhRYt67Yv+fra4sH0MgsaSto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxis6K3pOkxz04op5RZxcMsvArTqVRsBj4dSI5XRWp+rHwZ9y0a
	yTv8eRuH+CyJeMefoOvm6DKd1xakO1OvwvEX0vFzs1DH9mIiafTqLNJmU2pXnGUC+pxSYyANB1v
	7W+JFVm3mc4V2T0iLBYhB3SPs+BGut5xx7ZYr
X-Gm-Gg: ASbGnctAml5wXbwwlc/Jyv++yvdmTbXSpiZcUJMMnOfNkQTzuCFiDueyFEhfudxjkIU
	qAmhO+Y8/+tyGYLtZ+oZa0Nh3qoA9LZ3FitiFDUox99HPKq6LDxpmFLP/G9fbmspBt63S97WVoC
	nRhhWsntl/wmlBlhCbbd+b6i81nww=
X-Google-Smtp-Source: AGHT+IGGKeh1EpQMYynx5hvnTpfA93QPr7tRGjDbL0pfnfRCPuI/C+zfC4lGMZ7yDzmX8BUbEO0DLcWlbMVbhc92Gao=
X-Received: by 2002:a05:622a:1907:b0:461:4150:b835 with SMTP id
 d75a77b69052e-471757d3a71mr6862901cf.6.1739209241673; Mon, 10 Feb 2025
 09:40:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108202515.385902-1-david.kaplan@amd.com> <20250108202515.385902-11-david.kaplan@amd.com>
 <CA+i-1C2LD1A-QjTmGv-ONB-1+jmecZSU7i__G7gf=81VUNMKCg@mail.gmail.com> <LV3PR12MB92653F0B1D1D814A47591DF594F22@LV3PR12MB9265.namprd12.prod.outlook.com>
In-Reply-To: <LV3PR12MB92653F0B1D1D814A47591DF594F22@LV3PR12MB9265.namprd12.prod.outlook.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 10 Feb 2025 18:40:29 +0100
X-Gm-Features: AWEUYZm1TIQ_cZNQQya5O4IGv2H0sdgBX-b_ABdt18NKPNujbCjLb4di-vtwC2A
Message-ID: <CA+i-1C0R7qsPgL7i1NGELLAP9weumXu8vX9x-Fo6JZbKV_=cog@mail.gmail.com>
Subject: Re: [PATCH v3 10/35] x86/bugs: Restructure gds mitigation
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Feb 2025 at 18:27, Kaplan, David <David.Kaplan@amd.com> wrote:
> On the ARCH_CAP_GDS_CTRL, I thought that check is really just to check if the MSR is present, before we try to read it.

Ah, yeah you view the conditional as saying "does that mitigation
control MSR exist" rather than making a mitigation policy decision
then I agree it makes sense.

#define ARCH_CAP_GDS_CTRL BIT(25) /*
* CPU is vulnerable to Gather
* Data Sampling (GDS) and
* has controls for mitigation.
*/

So... shrug, seems fine to me.
