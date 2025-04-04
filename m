Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE651E0083
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762579; cv=none; b=i9aoZZNq1jgb34VX1g4kTpfCoOhZ7O9bcRy/i962k2nW6whq91R/BCz2l0TnOzmqWuDzk4RVHgrNvB3FeRByg0cOecAm8PR+W6mjv5hI/A1degr373Mq8YTo1rzzcEk5k19mSnEyFhqP6JPZf0RzdsTt0lleglERoXm/er2BtAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762579; c=relaxed/simple;
	bh=5+rhWJ9/AaOnxl4/edvsj3Mhq/NPswu21jjxt69P2kM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pwiLWzpbae2X7nwxBQeTU3qZzlKhe5W0d/25EYLMbNlWCflmTqAUZDdiBnvE6GjOKF7lLSVbyOWE0H0fV7gq+MJq9DlWHVuieZvp2gDUVKTpQJ4HXCgR0rQsgeogAcAaTVFqYYwBfVYUlK5t+2VBqaBzce5RLqPSpeIX4I5BBa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IvY6SDnu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IvY6SDnu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743762576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIj6VBKjZOnFTh+4vM6JPksjZGxz/JfbdG4ThPXJ5PM=;
	b=IvY6SDnuSFXt7su3mg3DKmyWLo6F7h3xR4gjtCFfevLyNgSAqUGtu9/5bKZPMcs3RG5gdF
	9FLrpBzwxb62+EPQLzTSbJJJLOflaENBPoKePRR6i5Y4OkM2olQa7RlngX0QyB9QnBVPWP
	zs2BZr2HZtYn82PSy0Bp01b7oYHutBM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-hPLVj5Q8NoOKbd7dqGcdow-1; Fri, 04 Apr 2025 06:29:35 -0400
X-MC-Unique: hPLVj5Q8NoOKbd7dqGcdow-1
X-Mimecast-MFC-AGG-ID: hPLVj5Q8NoOKbd7dqGcdow_1743762574
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac3e0c1336dso137687066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 03:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743762573; x=1744367373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIj6VBKjZOnFTh+4vM6JPksjZGxz/JfbdG4ThPXJ5PM=;
        b=ahqr+4RqanVDaRCWFbXVCB4F8DqRg4fRxnzxFFUPm8g/I7VN85lD68ITos0qKBw8gv
         dDPrNiRt9gFLUNivwcOwkOry8bpyIWjNBhG/6t+yyvli46QvIQ57pJx965J0TtVWgNyk
         rcsLYQTSQnDap9wFJ7CX5LWTROFBUzm4mXXa0HePBH0Swh4wa3bO0CpTCwC+VuirWc2e
         EbDAWtYb9GR76F2e1DB4VCtkVAUqVSjsbSzMqNqWPCv5U+i27XOxiWrLq4M9E893sjfG
         C97sHf8QRsvt6eVlO8WZi3b5W3vGueSLmaZGPe0ubFwk1xM3C61dycgK9vmMwu9dPJY9
         kO3Q==
X-Gm-Message-State: AOJu0YwHZUgeNPwXaxq7p9kU5wvrqgucy1MyiOnejLbJb/4dfGB7wbaZ
	StpNRH4EU6yFCqb5w5t5EqOgRWZajEzSOuXr0T2v6sMWnocnkFDR8P425jRJAKIFg9UM5Q3tl9Y
	7B8EPk05056kn6qzaQh2cPaTELrqAm5V7j6BRzDLLAzIWxZthnloW/w21kr0gDzw01h/0XiBYRl
	u/kjIXSiInLBZ/22a5pcmMQ56hcRI0BGEfSr4lsB1yvQIigg==
X-Gm-Gg: ASbGnctW16+3SLcjsb+kuJL0jIyJnhhu15qMZjpaqGQ/Voh0fjG8ujiu6Nfnyjdo8JO
	JfxkfWJiyOOjhve4Qvg8I5+UR4Gh1vSs3Rx1Sn8pB+ej3E+WOJEe40fImVW2P+3JfJyNSrvYOwM
	5w4iSRQvDLYnhPol9gKUqqf69OeQJ3LFOu83tuy9a/qFgUziJHSm1MHy4F+tRIeQjKIAAzSFr6u
	PsJJotrelTqbJy5ergqlSzSp9YZFvdD60UaPxccYlrai+PZhFlK7qA0Fw0W7OnniHd5JN/ftI2h
	deSNjaxOWsifhM6RzjCv
X-Received: by 2002:a17:907:980f:b0:ac7:391b:e685 with SMTP id a640c23a62f3a-ac7d19fe8b9mr265179666b.59.1743762573273;
        Fri, 04 Apr 2025 03:29:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxQWmbdXNbO0s0OLq5wavir8e/NorfNubB6SFVZLkKltTIV61PUBG1neVaqpwJooF4AHCdPA==
X-Received: by 2002:a17:907:980f:b0:ac7:391b:e685 with SMTP id a640c23a62f3a-ac7d19fe8b9mr265177866b.59.1743762572908;
        Fri, 04 Apr 2025 03:29:32 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.230.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c0184d0dsm227635666b.130.2025.04.04.03.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 03:29:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH 5/5] Documentation: kvm: remove KVM_CAP_MIPS_TE
Date: Fri,  4 Apr 2025 12:29:19 +0200
Message-ID: <20250404102919.171952-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404102919.171952-1-pbonzini@redhat.com>
References: <20250404102919.171952-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trap and emulate virtualization is not available anymore for MIPS.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Documentation/virt/kvm/api.rst | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 469b64d229a6..2a63a244e87a 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8578,20 +8578,6 @@ may be incompatible with the MIPS VZ ASE.
     virtualization, including standard guest virtual memory segments.
 ==  ==========================================================================
 
-8.6 KVM_CAP_MIPS_TE
--------------------
-
-:Architectures: mips
-
-This capability, if KVM_CHECK_EXTENSION on the main kvm handle indicates that
-it is available, means that the trap & emulate implementation is available to
-run guest code in user mode, even if KVM_CAP_MIPS_VZ indicates that hardware
-assisted virtualisation is also available. KVM_VM_MIPS_TE (0) must be passed
-to KVM_CREATE_VM to create a VM which utilises it.
-
-If KVM_CHECK_EXTENSION on a kvm VM handle indicates that this capability is
-available, it means that the VM is using trap & emulate.
-
 8.7 KVM_CAP_MIPS_64BIT
 ----------------------
 
-- 
2.49.0

