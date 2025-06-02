Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAAE801
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748894258; cv=none; b=s8Cre+92ewZoBXemWO5uDVBaBrnoNvuCoimSp+kN/q10vnHDkugHah+1w8rBf5GYAZIwadftyOPx2GMvrCar1ch4u9hG6W9fdNIJNWioBX6kNbF1XfCJNOpQYLHD9ha+bYh4Mtci9GDqdP+ltfMM3MUClrKQpafoXcfhH+zZgHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748894258; c=relaxed/simple;
	bh=d6rXMvriGn7F74qvpM6fJDhgm+iMCwCspQeTuBeU+E4=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=pmYkKpTrvFPaFHCemO6rxiN8jmOw50De0YKZqERBthE8X85lUMS26BwML42M3KjTlvdrhY0MBpduBEG5QS22VQXvl6gAhCDJJOOGhz0Y2Kdy5moV6eLaEZNy/Pbu+kKqD2YvOC2RimIQegFZ6RKZOOXmDQG3y7psoWmHXudy7CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=meH3T/1U; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="meH3T/1U"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-740270e168aso3811109b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 12:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748894257; x=1749499057; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d6rXMvriGn7F74qvpM6fJDhgm+iMCwCspQeTuBeU+E4=;
        b=meH3T/1UPRvx1c+45JfmK6rlJqs3IldeRUehW0EbYxqX9Rc5n/ywftp4sGwVXVtCk5
         VwHZ34Bphi5PwMYO/bohwVgOrEZLZQ+JKjmq2+8iECBQzGUlSJvhuCpfmU39jFByQsin
         xqiNBX7skHAd4e2XXnT8JLf9/SdLA+31WnHYjizhyl/wD0tXPRvQILLE/OC/jYaulT+k
         0PL/6G1iNlN3+xA0vgY+G8CgLMLgseFT82KQWeQM3Glsp9r348Edd+5bUQVk1hz7U/WW
         xBbhOAHWsPFjBR0jWnB6TD8Xka6IFNQ7G5Qs2oIACQyNNb5DO/aPUhTEwk9zCU4I4IZ2
         gfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748894257; x=1749499057;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d6rXMvriGn7F74qvpM6fJDhgm+iMCwCspQeTuBeU+E4=;
        b=PXpUH1wnBfOA/ScqWwlis3FPY/zZyFzdrJ/J9NxABUHJUiFx3QrFu4Q1zj1iRzEoCn
         DAd2cIE7la6s6ekCX1UWs5kcCeaF70SWzO+eNuzixqTSK1VCal55fCR1p7Ptg2xFBvLC
         mTVf6Wf7eG8Nl2EjG0U0s8L3KH71bLyQcTTOEBHi5y+YsiC+X0IWNqgKIG8Q/MEU6cXF
         Goe/p9mcCxHbOn5A2rnwttende78KZLjQ4eaYgvI6Cngs5uqTfMr7Pf46nZmXTiU/xMh
         hRcH8SgPUcNivnj44duSpuPlB6XGic+fM8/547BVUMtHSS9+ehR2ZGpmA9DMqj0WhdJP
         RHjA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ9qz8JFuBLON8S75XvQJZNsxHmRFdOd6gC9TNQAV9tlQpFD9/2CKhcwBzkaZUJVOco141hq5rj4z9wPc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1RK+1SB+wdsVX4UjL2EmIzKkuWc90/PJLO6OfhVuUEpYHO+zS
	Vjds1WB2Ef7ye1lYkNZqDrmdY0aGFq69p+C9wp0wlBgmR+r7PYgXZx//4JJ80YoOBb//EQLB5PT
	hecUjpTAHUozOqC+6S13yQ7G6ig==
X-Google-Smtp-Source: AGHT+IEhiReAYaMOY2n8mKP/bO9xi4dqlmeJq5b6LQZT+kOdJfiK515hi4mP6JUDpG+R9Ei5g3uPaHt2Ni5raxGTKw==
X-Received: from pfbih20.prod.google.com ([2002:a05:6a00:8c14:b0:73c:29d8:b795])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4fca:b0:742:4770:bfbb with SMTP id d2e1a72fcca58-747bd9ef267mr21492058b3a.18.1748894256756;
 Mon, 02 Jun 2025 12:57:36 -0700 (PDT)
Date: Mon, 02 Jun 2025 12:57:35 -0700
In-Reply-To: <20250602172317.10601-1-shivankg@amd.com> (message from Shivank
 Garg on Mon, 2 Jun 2025 17:23:18 +0000)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqzv7pdq5lc.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH] KVM: guest_memfd: Remove redundant kvm_gmem_getattr implementation
From: Ackerley Tng <ackerleytng@google.com>
To: Shivank Garg <shivankg@amd.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shivankg@amd.com, bharata@amd.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"


Reviewed-By: Ackerley Tng <ackerleytng@google.com>
