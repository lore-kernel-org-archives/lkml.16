Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F0D2F3627
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750890350; cv=none; b=TpYUUK5wudBXrJEfXS4dIsiaUpxZWZS4mR2jTDxCTiubheFq/fL0W3Uv1rbo3B3kZga5SvrrnVpbWZP8masq3+g7f94KClP1iXgBW6cF+bCFKW4ISTOzQgauTp1Gfjm7wwFnpbYPwgjwb5QrdMsDazQWa47qMihFU5Cqp6L3GMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750890350; c=relaxed/simple;
	bh=ZcdoOQwxU3CyDjJeNeZEEN1pVlwH2SOB9r0ExNTnb5I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=imy5lX6e45CBK9I9xzrmnDEP5rV9KcYRvfXzUIhdg/Q0+AtV+FWkGBjyQGWIPRe/13u18tZyvwWR6yjP7EEeYrYmsB7Is0Z+f1wLDYaM5419Kw2NUepWtfrmghsIfnXG73hqc5E0EUyKDkB+bc81pHlMcF7uV95GKLr67kmmV3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lXOLxEJB; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lXOLxEJB"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b0e0c573531so158505a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750890348; x=1751495148; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5pLNzxxeBjc6JUZX/DPJvwEcneL7Rpxq1mf//0ev+Ok=;
        b=lXOLxEJBQryHT4LNVSZsuTyaiDf91QoP7vGZvMbYfeHOMXWxuOpcFqUIU58e6rCf4A
         N6SZF9gqfNH7t5hXBo7peWtQ9ss7pYxWx33jghYig9U4a3YnS95uM+wEbbiRHGjNLQw4
         pJcYVBk9Xw6860dWIoONga/Fwui265U2UeD/3lkWAJ4rdKMUzYzO/NAOBxiZFPqM65xe
         2FYUTpj9LCyKXlQHME8JscnCyJwhFcMzcYagdQi6e2ssHYjU3mFUXAxmXWpnEhNsMhlP
         1RPGJe+ebpKOArgfu7J1hbv6ko2X3rFQ64gTIQQRWIhQUXyw/54RGgtSNBQl3YphYJ7O
         PpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750890348; x=1751495148;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5pLNzxxeBjc6JUZX/DPJvwEcneL7Rpxq1mf//0ev+Ok=;
        b=sY71QCoF74VvQQ7k+7SEKV+8JTImJkc6ebBTQFZqKg4LFvOd5DdKS+JnuMBtGI28WL
         wyDDkVst+HlE1WZUWOhx6x0Yz3LHqSIVryUHudJWjlB7IlW8hT5x/hpBGfSO43vB3U+b
         Iutbfh0v67U4aN2o+DVEEAlPh5qnmXcBa5NztBuKL8bBzdtpDvPo4DBgxBU2pjXLVx47
         nqOYYBQ1pojs98GJbViUCW3H77QnY0hq0OKrI9iZf38E21xM0JRv5Yco2gMfvDGGDBsT
         iQyRCefLpfdmeRBZFufDifnwKevH9ECRnC4ZzbPOdpAhOx8rUSlw842lIl1H94geTDMy
         dGEA==
X-Forwarded-Encrypted: i=1; AJvYcCWgav3eD9hIa1eJACPi3rDmVVtdkQdhhaW5gL6liFltPJyH6RuGEkAkoAuqmUCzV+65fq2N6GVhid4Vt6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YylKrGZ9O3Gz0JkB3bOxxXFP56ocDVwnhjPqMuvzMAoX3SjMwLC
	L9hWM5nojaLX/ngiCd+c833JYef+VPYoNHybzWF1s1629wjI0rris9eyTcJAy2kN3N0cHlz5+gn
	XK7zm1g==
X-Google-Smtp-Source: AGHT+IGuZn7pr623L+iySvz0JPQq0RwUo97Ncwcpf9CRRSz7v1+SZ3zC/cCqj+R0ROv4T2ZbAMIBF8HWc+8=
X-Received: from pjm11.prod.google.com ([2002:a17:90b:2fcb:b0:312:ea08:fa64])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2ecd:b0:235:2e0:ab8
 with SMTP id d9443c01a7336-23823f879c7mr59561265ad.6.1750890348479; Wed, 25
 Jun 2025 15:25:48 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:25:23 -0700
In-Reply-To: <20250625014829.82289-1-binbin.wu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250625014829.82289-1-binbin.wu@linux.intel.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <175088967862.721202.10079126901672236105.b4-ty@google.com>
Subject: Re: [PATCH] Documentation: KVM: Fix unexpected unindent warnings
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Binbin Wu <binbin.wu@linux.intel.com>
Cc: sfr@canb.auug.org.au, rick.p.edgecombe@intel.com, kai.huang@intel.com, 
	adrian.hunter@intel.com, reinette.chatre@intel.com, xiaoyao.li@intel.com, 
	tony.lindgren@intel.com, isaku.yamahata@intel.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="utf-8"

On Wed, 25 Jun 2025 09:48:29 +0800, Binbin Wu wrote:
> Add proper indentations to bullet list items to resolve the warning:
> "Bullet list ends without a blank line; unexpected unindent."
> 
> Closes:https://lore.kernel.org/kvm/20250623162110.6e2f4241@canb.auug.org.au/

Applied to kvm-x86 fixes, thanks!

[1/1] Documentation: KVM: Fix unexpected unindent warnings
      https://github.com/kvm-x86/linux/commit/0c84b534047d

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
