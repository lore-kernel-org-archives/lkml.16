Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88933BA4A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750810329; cv=none; b=XFcM4K83T9kBeuyYb3ig65TUhPoot8nSwS2Yo7k86x8JdG6WvlPMzdw7rC3iyQ/J5eVwYGYWhWwRH3zIWty1RuQkgR2ZR/bEHMfjYW1+7n2p6sBVNuhuUJGF3IVwY5A6wTC5b+sibHhdcgjjJYJxFa5sxy9eSMvzvkSUrQWcApE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750810329; c=relaxed/simple;
	bh=4eoSUaocYmaWsmbo5jnksZ2C3rx/pVjA9dIc1SBhIag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a4bvDzAC0FHdhbJgFKixB5wp8YUayoRlR5j5lAf2jMilZyvlni1Hm/s3k7tkreXAmvdOvEvg9Hbko1ETYfCEfrqCHejMcIKSZofo1ohaC9MqvHXD0jy5IfUr4s6qSwVPu0ggc6mRArQBkvswfIerSoSo1tuk9bnZWHq0JPhEHeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=us+62I+r; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="us+62I+r"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-609b169834cso5332a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 17:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750810326; x=1751415126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhThPHLsvNen0jbqs0BDq7omrwoGam4W7cLnmLsm00Q=;
        b=us+62I+r8r9eueggNzLoXt9ykNlfbtLFELP6jjljSUz/GkWLOswVq+AX7b4szSztip
         bBi8QzapgzEBjdSKDB8ivtX+LhDoTi1+n7eckpr/b+PLZFDUS7mU6E0lTy0a4Hl/Dl5h
         cMQ+blbv1q5gWI/Rsq7I+j2lvdPDTdiO2Wj9ZQ9cfJnwCDjhAytIaiC5Xy7/BEY6yWNF
         mQQPguZsqN+1+fxCuGWc3FU1iBqkaXl+8DWR8wk9AFec0wfzlf52mbKL7kTTQp/KjTuz
         oZWiPm5kPrHKd8SjnLtLIQGVDYQpxVCab7HJRggCiiJ/oQVQ3R8w44+8pO52AAC1+0PV
         l9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750810326; x=1751415126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhThPHLsvNen0jbqs0BDq7omrwoGam4W7cLnmLsm00Q=;
        b=hJxbAeD53KdET05jvvxn3Q7eh6fs4C/ldVQxYP/wsDngAtm1XGaBC8QgoeAtIjIeqj
         yOwO8rn/ekq60vCeiHG8E2l+TZPkrUCrzHiT1y6ybmFMyN8zT7mZvCe4dgsoxar6yB7P
         IA/RL7Fex8Fn/u2JFfULx71+PsUFs4nZJUJXRRfOIN1m1CGGcp3NBWq/ptc0PGaK185B
         LNStRETm1RidCEE5FRCgSoFbw5BZ53NeWLFlk3hBZGQ0eJLaqMQnKw6vzzOQmiN+/Nhd
         ycRrMVTvrmXqbJnWmCyf4xxtW5cVU7+qyGj/WnkEbQNPrRQ4beuvI6U2xqCGQ14KKEG7
         uvNQ==
X-Gm-Message-State: AOJu0YzQEIo06ZmCZcOwVgNuQR6i4EH+YYwPbR+F8qR2Ao5toEXTxnXA
	cXrEnfe5G1wwGeMvToAPe/LpDiHwm6ykdEuwf3k8PKPoPLXYmvzoTQ5dS9K8PoZCldme4Wz25Se
	Jul7x8QNQsaS0w64xpgWxaP2NCD3Y9YZlN1b+R/9bs5QVIQ5fjIesGcSo
X-Gm-Gg: ASbGncs3YGEAkx7tUTJM0jlADDuS+9J4YLl2EUMmCM2ANfvK5AyhqEg0soQ3LFwNgpy
	sFUuYahPpg2pyVHBYjjejgtEJ6gSDFboGXAM7/HqMFOmRSCA7pkcEq/ZUUB/HP6+2+WlNyF8sYK
	I8MR0FmZllTCNrY1inCXUYXx9QyrF9kkjm7+uctZHbZP3loSxVJj+vbg==
X-Google-Smtp-Source: AGHT+IFSOFiLAN3ICey2GAdu0RNYWTKLxB7jGvanJwTfeh4aRq0sUq04sobGMGS0G2nqBQj2terPEeZjtQHCwiw0uro=
X-Received: by 2002:a05:6402:4408:b0:601:f23b:a377 with SMTP id
 4fb4d7f45d1cf-60c4fba5fe9mr11095a12.6.1750810325709; Tue, 24 Jun 2025
 17:12:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530185239.2335185-1-jmattson@google.com> <20250530185239.2335185-3-jmattson@google.com>
 <aFs1OL8QybDRUQkF@google.com>
In-Reply-To: <aFs1OL8QybDRUQkF@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 24 Jun 2025 17:11:53 -0700
X-Gm-Features: Ac12FXyF4HyLSGZZxKYDwfWReaDHVxBdd4mVp7eJRLyg4tWKSRBXXXXKbx-1nzI
Message-ID: <CALMp9eTi_8T3Yyz6NYqqmKsgTLYKVz++9qt=2gdoxty40Od5Lw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] KVM: x86: Provide a capability to disable
 APERF/MPERF read intercepts
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 4:31=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Question: what do we want to do about nested?  Due to differences between=
 SVM
> and VMX at the time you posted your patches, this series _as posted_ will=
 do
> nested passthrough for SVM, but not VMX (before the MSR rework, SVM auto-=
merged
> bitmaps for all MSRs in svm_direct_access_msrs).
>
> As I've got it locally applied, neither SVM nor VMX will do passthrough t=
o L2.
> I'm leaning toward allowing full passthrough, because (a) it's easy, (b) =
I can't
> think of any reason not to, and (c) SVM's semi-auto-merging logic means w=
e could
> *unintentinally* do full passthrough in the future, in the unlikely event=
 that
> KVM added passthrough support for an MSR in the same chunk as APERF and M=
PERF.

I think full passthrough makes sense.
