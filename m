Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D7D19CCEC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743624389; cv=none; b=fFxCYQPXPy4I2jsEBO3DX7ySYOnedQwCG4DV+YAGbLgyXku25uMIaQTTWHvgB6x/Br40OB3qYTxYWKip06Qhz7Q2QM7P01UWrKI71F9zo4tOCSkcJR50M4oaqG8CCMzR6mCUMJj6L2i/AxbV/3CudacYP08jRyvFrZHyfJCE0B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743624389; c=relaxed/simple;
	bh=Z511ExWHOkpvZkTUAIF1xEmNqB2nN2j/yYIsjlignuM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FFWwe8BQxPyyuXBmdr3Cujfnzil5nzUj/lWFavrs0Rxa85itjvYVpMU5p4DBjq5JZ+yxG8x9XVjV7AJZV4Xua7qERP4qOVY7fcTrWvKIxSrF670+w3Hqf8SF3WNYj6anqe+EOHSljLkXKNf1tRIPetolRjsQwS3RSidGSB74zaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h1xng1FC; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h1xng1FC"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7369c5ed395so209441b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 13:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743624388; x=1744229188; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g1UYmbv2w3yc5otQhqEJOM+obYGjt1TtH6vbyo6igyo=;
        b=h1xng1FCB5bcFZFPigHj16SQv/F3Rf8cjsL/7m4Hjlok8Tccoy1P7E2CxYrsBtS+WH
         6cHmwyXhtdOA7orUHxlrf0+ZuAF/ZECnX8adufj5g51qC3715bx/oYv3rrnhKdl9QOQd
         MieUumLqvhKzqzbmRlF+dzqtTNjfKrZpJkqwAzph9b62OTQYXC6J30lj9wwEl4UII3u3
         OppA7DLrlM+O0Ot3xxDzFqyVsA81Qz93UEEGQea+LOlKHnmrty6B16wo8tVp42c/JwoA
         t8266EV5lbJWhm7yS2vW3+G+K1+kNQ5XV1qU0vSgN4aM5OJv9tA9Kpx17V7qeewNosyj
         5mkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743624388; x=1744229188;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g1UYmbv2w3yc5otQhqEJOM+obYGjt1TtH6vbyo6igyo=;
        b=KTrWjUEO3saJ7xGB2AH++elVF0th2+fZKIYO8PRighA8uRr4WUGvcIxBrzFnGboAgY
         G8hXTbMp5LuacVpE8xVyeXLTtLf8rTBjQQvVUhkm6qza0PpVNcBvKfxyc0KZRWX4weEJ
         0K01+TNjTpMe5wB296pzwJyijZEhxI5wsjkfDoDnc1exwb0zhF1E0cJy/sMAHPvw74CP
         SUVcOi4iDRVfowPd2GAHh3xZk4ua4Rw5WUPprjP4nLjW2VtEjNXZc/hCTw3xqMNjV9Uy
         TE2tQLEsY/pBJcGvJRzRr7kncuHfbxstVxIgcgLv4O8+r4PorCWE62HHjd5VgBaWlQjt
         34iQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8AmMfSwWemMzYe0ZMdYrbiJKDQ9IXqVf+nwShjbNE+JZ0FLvv56mQPJOiNHN4S0vDPRI+uHJQCDtdXBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAvL5QM+go3oCWpjSAlCB1jxXu7GPT5BcqVaAHWl8TntUo0Zoi
	l/Itv7w2VnZ+sDBuaU/RfukXcd1Tt/IxcKlIMyj/77sLP/+UP3JpAjcqJbN4b1c7zzZWS2oTgZ4
	LoQ==
X-Google-Smtp-Source: AGHT+IFdwlbNUEhA5drbsYbULq/4vEQIA4XkJbgogx/Nxg/eRY8AIsO1wKjgM+KvnVOXc9haiiqUOh44YzU=
X-Received: from pfwz37.prod.google.com ([2002:a05:6a00:1da5:b0:736:3d80:7076])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:18a5:b0:736:a77d:5412
 with SMTP id d2e1a72fcca58-739d855eeb1mr62511b3a.12.1743624387693; Wed, 02
 Apr 2025 13:06:27 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:06:26 -0700
In-Reply-To: <Z+ymyiNlzJtM50gF@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401154727.835231-1-seanjc@google.com> <20250401154727.835231-3-seanjc@google.com>
 <Z+ymyiNlzJtM50gF@yzhao56-desk.sh.intel.com>
Message-ID: <Z-2Ywg6UK8lLYklA@google.com>
Subject: Re: [PATCH 2/2] KVM: VMX: Use separate subclasses for PI wakeup lock
 to squash false positive
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 02, 2025, Yan Zhao wrote:
> On Tue, Apr 01, 2025 at 08:47:27AM -0700, Sean Christopherson wrote:
> > I.e. lockdep sees AB+BC ordering for schedule out, and CA ordering for
> > wakeup, and complains about the A=>C versus C=>A inversion.  In practice,
> > deadlock can't occur between schedule out and the wakeup handler as they
> > are mutually exclusive.  The entirely of the schedule out code that runs
> > with the problematic scheduler locks held, does so with IRQs disabled,
> > i.e. can't run concurrently with the wakeup handler.
> > 
> > Use a subclass instead disabling lockdep entirely, and tell lockdep that
> Paolo initially recommended utilizing the subclass.
> Do you think it's good to add his suggested-by tag?

Sure.

> BTW: is it necessary to state the subclass assignment explicitly in the
> patch msg? e.g.,
> 
> wakeup handler: subclass 0
> sched_out: subclass 1
> sched_in: subclasses 0 and 1

Yeah, explicitly stating the effectively rules would be helpful.  If those are
the only issues, I'll just fixup the changelog when applying.
