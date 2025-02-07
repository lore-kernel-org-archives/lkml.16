Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C9D13D244
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940829; cv=none; b=odxVkRq3hUestKLs6SOKvl4c3T3KOc3O0FR0Qgca2jCVTl1k+fO8S38c2Xgo5lalagbtI5UuaZYqZwKTV9O55jxx6G3XFv+7DR8I65LeNaUOZSDjgJwREZI5GhpQpnJ5VLKs+g9/dW+ZIt3Z7i5oGXXE/QGj+DX4+6WTR19psSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940829; c=relaxed/simple;
	bh=UXHwzN+hhqvpaB8oryjS8Z5As9+aId5qsxrzOd5xfyU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aZZuQcH8xbkKrfbe1l/PMVEZNIucGs2XIqWFgozfH+0U9IHTukt0g156KDrnDZy2VFmUnvnIao6qecD42zuhuNBGXMCFO1htwytNjdfTWpkLAzhINkTLdEJGZnKU8BHsPdcgfl2y7YcyB4HbZknVtFvRzC1ZDaFt4Kmh9S3oyGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dQIHCRYt; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dQIHCRYt"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-216430a88b0so48564905ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738940828; x=1739545628; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JwkxBxZcQBcLsO8nPf0TC2IO5kxYAK/AMIwJYJnd5HQ=;
        b=dQIHCRYti9Lz9/0G0+BFs1iZ9u28nhGHHyzmx/Dya5CTR2S/8/8+sT62+psTucWtRs
         0jnA4LyOJwDmOxCIz5dmtIyfPayfZ6dDE6EH7i2v1e+i8iHLv2EfBWYdZtjFRbiO7lxZ
         B2z7fSHhJrxcAvpH16HAbfj7w0UI614wr0vb9IRt98lneQY+2t7BjrjwPsUv03S2JEas
         SE0bDaeD3o1BTcsHnzPe2Cqm8wgs8DiVvvlAmg9J64thd2B4GdKGDidMeqba5XKUC5bI
         lD2+2uuO1CXP0sDLHCLV8rbHOwOLau3r9XLye3iyiMe9EXIW1KjDcsNPD7GZ2xZTURMr
         Smpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940828; x=1739545628;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JwkxBxZcQBcLsO8nPf0TC2IO5kxYAK/AMIwJYJnd5HQ=;
        b=kDpjT6+7TxFVAU4ybnO1INjiK4bBqsNX+xjInekNq831FZH9eUX+kjl1Gb1mu8tTMp
         Mn3iVu/ffuS5bIdkMJQIN/A7/BK7HUkimEO3gP4TQy5tW2Qi59d7oXCfIslz1ZwE0eLP
         YPArmf4II63a3QlKlbqBbNkTcBdlxRg6aVNt1FqSVmVgjRmSOidzvo6UzyanQzBNZGGv
         brdkJ50qUmmR99tk4dLz7xYL/IpgQudvU+NE3glwhXXx9yhzdycLXmeqowuK8APz/Xak
         RRx4uv20aA3SUKdCLZmMNpBwtUn7HPGTjrChxGnp0qfXs3dRKXpc8/Zb7WBA9nBnosZj
         XK4g==
X-Forwarded-Encrypted: i=1; AJvYcCX5mmlyXDQR+w0+X3r/FbMNBhpoKNjmm9GdPNNIXhAHhsyQLcn/ucwyh3I8UQ/FnpnO8BsnBS/lI6KZ8IM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo2meqhcPDstBOn+e8kPbMylYCFri0DkaWcShFat8TFcxcoycg
	hmFF3b+mXZap5A3eITB62JYCgB8rOIL86j2zHTEn9gWUzrh+NouMQ2NsEU8DLUpwi0Xeahr1Buq
	BBg==
X-Google-Smtp-Source: AGHT+IGGpDhL5qjOXjpc+tbAffWAMRWeGGRYB92uTPnhMOQHyur2dAnBw5Zz08W7peV+bs0ZmkT9+t2j174=
X-Received: from pjuj12.prod.google.com ([2002:a17:90a:d00c:b0:2e0:9fee:4b86])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e889:b0:21f:10a0:ab5c
 with SMTP id d9443c01a7336-21f4e701118mr63403535ad.26.1738940827808; Fri, 07
 Feb 2025 07:07:07 -0800 (PST)
Date: Fri, 7 Feb 2025 07:07:06 -0800
In-Reply-To: <20250207030900.1808-1-yan.y.zhao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250207030640.1585-1-yan.y.zhao@intel.com> <20250207030900.1808-1-yan.y.zhao@intel.com>
Message-ID: <Z6Yhmg2nmUAtp4yn@google.com>
Subject: Re: [PATCH 3/4] KVM: x86/mmu: Make sure pfn is not changed for
 spurious fault
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: pbonzini@redhat.com, rick.p.edgecombe@intel.com, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 07, 2025, Yan Zhao wrote:
> Make sure pfn is not changed for a spurious fault by warning in the TDP
> MMU. For shadow path, only treat a prefetch fault as spurious when pfn is
> not changed, since the rmap removal and add are required when pfn is
> changed.

I like sanity checks, but I don't like special casing "prefetch" faults like this.
KVM should _never_ change the PFN of a shadow-present SPTE.  The TDP MMU already
BUG()s on this, and mmu_spte_update() WARNs on the transition.
