Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86759221723
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743540426; cv=none; b=Ly07ZtGKhPg1XFWXIKdHFJorStasMtxIGMtRKtYizXGU6680nMvCz763W+uGA4c3KxMFTw5xZ6ghlv9eWMbEkrMh83u7bWWEOUStxFbGvyRtyzScJGKmX7swe5K4lCVbGJqzZditWJ1Du2xEvHS93Jeb6YlZ182JPMvRiQJwjVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743540426; c=relaxed/simple;
	bh=vPE6Zg+Is0XKaMNp6fIjGpoFx3l5te14lZBJu/kZl5I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rq7yCbN0YL++aTvMIJsGCPeCkr+wjeVLCCeIEK50wNg7Qa/t46He5iVyTExMC0jgTCDZTbKh8Gc5DeC/CTniJPLl4rj2I37kaaF0qSth3Sm+Tre6KLEBTOB0fsHMXyFGeTnS1tra+Jz4AIfOvBGfzmG6M4aXFoPqHdtcX+gXJBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=paOOIBBK; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="paOOIBBK"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff7aecba07so10183178a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 13:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540425; x=1744145225; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5qKsANY9N47hjadaMZNM56aBAj0f8nczwxZTz9+A9lg=;
        b=paOOIBBK+RA1uOJo8IFcU8v+ZUWemxv+67ogV8RX7modDidTLSKMZbEpw2AHrY1DtQ
         SqZafaoxumHrkF+UGKTGzaHqN81q/qomuQ9XOqEKF61xmoSGW4hz7+bS8R6tqBHDOPdi
         d3ODiiVP3Oiki94gdmvNbaij1fhyon6HSusTY+ei/lvwNwFHTCWCkIIko/Puyihq/yfD
         ZRPlf8jZPK8Slnp4Ei6SB7RXTwu1BzAcDt1R3G/1hzvH1kt9YDxDb2PBGgipG+OPPYia
         Co0kQLSKZEphhtGEADvIglHCU3ZYpVI843naz+Rg284vqyQ3sav9gxcHj3j1b+YSSEpb
         WLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540425; x=1744145225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qKsANY9N47hjadaMZNM56aBAj0f8nczwxZTz9+A9lg=;
        b=Nbqn08baEfL33C4qtc8+8LSPtaP1PmxKBAHTOSsK+STh54VwZb1kJNuyX/NeU7n4DG
         0MMmdbWIWiTIbr3PNtc3hvQWkyLNGlGhcvQO1IE93m8P/+hCl6Ux8X2ibSv0PJlHYLPN
         q+/48UftZ7CCb7kcakVcIV0SeJS3/wF9BWM96CfFEndyLQtcZhLERF3mRourQyPh2pvt
         WDkzAt3hiPA1jfyaCvaAA7Jz5HZY/9o23vkfITBlqIzl43lS2d1fYY7wGEe9fkjgwYx4
         eI3ohtcqEOkO7YSfU0Adu72SRfZNBhKTV8dH6RybVH5eJBkoSpyAKsgT1YLtLSodoCt0
         KrhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI1Wo+taRDFwNvDZZ1aFyTrRmMhqeXpurkM0lnEl/1jvVgF2UyQu1BK5DHHvGyG647xsMa7XaD3Fh4OiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9AIid9VzLhhpUbuShbyFKw7xCqbcLQfc4HCM7CLeZk/AgmEBb
	UNZK/WHRNfMQVhjc7JSYRXfH+ncJzmwYtht6FdIycIobrzWeaNPJZ+ljXb+Im/KOScjNgsZdvsW
	WuQ==
X-Google-Smtp-Source: AGHT+IFGVv11dt7rUK+obI9Bx4C62kJ/MvcG+5bk3TDAhhA7vlmUxcL80d04RZFegq2L9eKJhwQmELWuf+4=
X-Received: from pfnz20.prod.google.com ([2002:aa7:85d4:0:b0:730:9951:c9ea])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:84b:b0:736:6279:ca25
 with SMTP id d2e1a72fcca58-73980463170mr23448772b3a.24.1743540425095; Tue, 01
 Apr 2025 13:47:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 13:44:22 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-11-seanjc@google.com>
Subject: [PATCH 10/12] KVM: selftests: Assert that eventfd() succeeds in Xen
 shinfo test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"

Assert that eventfd() succeeds in the Xen shinfo test instead of skipping
the associated testcase.  While eventfd() is outside the scope of KVM, KVM
unconditionally selects EVENTFD, i.e. the syscall should always succeed.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/x86/xen_shinfo_test.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
index 287829f850f7..34d180cf4eed 100644
--- a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
+++ b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
@@ -548,14 +548,11 @@ int main(int argc, char *argv[])
 
 	if (do_eventfd_tests) {
 		irq_fd[0] = eventfd(0, 0);
+		TEST_ASSERT(irq_fd[0] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[0]));
+
 		irq_fd[1] = eventfd(0, 0);
+		TEST_ASSERT(irq_fd[1] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[1]));
 
-		/* Unexpected, but not a KVM failure */
-		if (irq_fd[0] == -1 || irq_fd[1] == -1)
-			do_evtchn_tests = do_eventfd_tests = false;
-	}
-
-	if (do_eventfd_tests) {
 		irq_routes.info.nr = 2;
 
 		irq_routes.entries[0].gsi = 32;
-- 
2.49.0.504.g3bcea36a83-goog

