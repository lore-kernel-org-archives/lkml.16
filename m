Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7402EA47F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794144; cv=none; b=T0Jojvpe39mmWK6ntizSCa6IzoF/hC3MbB781WqPUEwZ+aANe6/9sbh21SwEgTF2Y4od5BXRwSaaV/gV0XP3y/phCsFG18c0dbPxSL++BzQHJ2UVrNtMiQlNvcSoXvWTRDXBXQlgxEGuc578LVN1hNzVyxGKJ0OEYXKQp1TLMo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794144; c=relaxed/simple;
	bh=v88psYhC4Xlq9eWyn2S4RG8kNy1savvZGH23Z4vHn5w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZsTYNrbp4juaBXW8yYlQ2ZO5kSCAZLmA3IbvfKO7j1PfylvAWmMEioJxM+X/hwaMCFTtZvd3Zyc9GtkMP2pixlMLs2TdhJJaPGaGYSoqNA0/+1yWmFq+6GVYgA52CFkupK3029YPgAA8FXDSC8Fzp6MEd7uyZvGNiDyXithFbGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uCHsAVsO; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uCHsAVsO"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-748e6457567so64068b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750794143; x=1751398943; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yjMaO2ZHYgUWaqMqKniOnU+Hc55RnjP49wr+GC9QMd4=;
        b=uCHsAVsOM1wOILxseG7C/SppSc4l2yommCexZis0OeYo5W2Eo6JYrSeWIP7NwU6yBy
         lF77+ye6JMlhOWB+YpE09NHMVVioR4BbZJOfDz30ivI3HAin9P9UtXsFmjCphSymb3Tu
         NCMoyirkwxI4xl0vxeG+fYIKFsgbsM9Hmj6qxNHKE2Bm1blBiEJEyDD1PrpHPpVwpc0C
         2SDr8h77bBtuUQ97mTdwoQyHG+TUgCjHgGMdK94BYBeqHdF9qG6RVKPNosglDqyvtIVv
         DN+x2WK4CTYGF7Fx33sdZBn9Q6YUJIRbZCc8pOPVoKPsZUvLpN60rrKJBuwTO7FeW7dk
         3d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794143; x=1751398943;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjMaO2ZHYgUWaqMqKniOnU+Hc55RnjP49wr+GC9QMd4=;
        b=RTYVqN1AWDCGV089gVOIQ/TR5KqMFlCAE2iqlFRl9PMS6v+/BPhq3HuKZUq/wUXWiN
         cEFfrqkBvVXmzHJixrEa+2VxO+FG7PYYh+WXWlS7i7PyJm0oWXoCB3o3hvDzjH6Dr43/
         fR2B5iqcxORmVyjgszF4nzo1NL6D2PXoZpwQnqdOg+t5hdm+zHigwsVO6Wz+uUiNAeSo
         3kiv72kNjTLiDZKQC3AUqnOz0Il2gHrWbJsNV/kL8pD6hC7SgAzZuDxxhNxWgLQmYUq3
         KiXflnSampuY5BYRw4oC8+Y6ONU4S5dxrN7UkhmWsfr9xfGzJkEmXkmS9hDDA2xhieJQ
         W/ww==
X-Forwarded-Encrypted: i=1; AJvYcCWWL2Qa6d3/rAyDkVFo9FLpRLqk0g9+T5wzz+uPF/2rfgR6X9yo0OJ7LCO+Qqsf4zTfGT3xgfQeZvuXx/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxclXKYy/uxBT4dSaYomA9pG9vExT678TkoUaDTyQZO99HayAb
	qhOKlL753jAHokyDeqssSWadq1Ekyy1Z704IPZLCpZVl+us/ZZSUgMG5mvBsp6ugcx2azun0aSJ
	P0sQUgQ==
X-Google-Smtp-Source: AGHT+IELqzwrkH6ayekw/v07G4muYW0xcxjhWHO/BVt/+UPZ1juGa+hX/I4JPrYPJvEz9xpMX5yGSYKDGc0=
X-Received: from pgbcp4.prod.google.com ([2002:a05:6a02:4004:b0:b2f:9bf7:7145])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:438e:b0:21a:de8e:5c53
 with SMTP id adf61e73a8af0-2207f3067e5mr300077637.12.1750794143030; Tue, 24
 Jun 2025 12:42:23 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:38:43 -0700
In-Reply-To: <20250516215909.2551628-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516215909.2551628-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <175079223259.515104.13388521699200936285.b4-ty@google.com>
Subject: Re: [PATCH 0/4] KVM: selftests: Improve error handling when opening files
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="utf-8"

On Fri, 16 May 2025 14:59:05 -0700, Sean Christopherson wrote:
> Improve selftests' error reporting when opening a file fails, e.g. so that
> failure to access a module param spits out a message about KVM not being
> loaded, instead of a cryptic message about a param not being supported.
> 
> Sean Christopherson (4):
>   KVM: selftests: Verify KVM is loaded when getting a KVM module param
>   KVM: selftests: Add __open_path_or_exit() variant to provide extra
>     help info
>   KVM: selftests: Play nice with EACCES errors in open_path_or_exit()
>   KVM: selftests: Print a more helpful message for EACCESS in access
>     tracking test
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/4] KVM: selftests: Verify KVM is loaded when getting a KVM module param
      https://github.com/kvm-x86/linux/commit/fcab107abe1a
[2/4] KVM: selftests: Add __open_path_or_exit() variant to provide extra help info
      https://github.com/kvm-x86/linux/commit/6e1cce7cda1b
[3/4] KVM: selftests: Play nice with EACCES errors in open_path_or_exit()
      https://github.com/kvm-x86/linux/commit/ba300a728f6f
[4/4] KVM: selftests: Print a more helpful message for EACCESS in access tracking test
      https://github.com/kvm-x86/linux/commit/71443210e26d

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
