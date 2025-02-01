Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03263625
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 00:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738371052; cv=none; b=cFLzMBZ6G38ZKGdKcWm11jZygCf+ea/249ASMbSxyNf/NI/F6Zg3IJ3Yhu5Fx8HQAfm/DHth46RYidudwSbq5z07nwAHY67K+DrxEi3LTRQ+7dT15I3U1i/vb+ykzd3rUYwMdw2BXk/fBFOLV5cWAscSxOnSelD+AcqRfUaOSa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738371052; c=relaxed/simple;
	bh=fXRZwu+oXpcxVteww5iwBUgpDb7cO5xtmRxaTTNiJW8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LNIPx+14OdT+mTukJHonyc2dqwmvTLuaiTfjHFiPwqdlOzKWqEc5DP7lcP/ecQtnU7OkZ+2vmGBUs1LiU+5ImFZCw5aELwL86Q0NZjNLuzOD4xAqpoPrcEfT4IAnT4tZFk6+ICBr9Vgio/Qfxi9pogbx9t66cYSYjElazvvxAq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FNJYn3M4; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FNJYn3M4"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2efa0eb9dacso4982882a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738371050; x=1738975850; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxeqp0iUagZtsoZjwTJV6Mkmpp79QeV032AbydK9elA=;
        b=FNJYn3M4uqMPoL7qMNhOR1bpAjnj76dOC4PJ+RvT9cEIfIOVxfUEQuHo1fyykMfpYq
         5A/xGa4Cv2wTbhTxJ46iba5YoWxTBgAhW16MgXPx4FoXdVwFdIMW/VmTn8bjkqklCvNR
         GP5y2jL1jKzvR3R6v71d7arcc2DfZw2Hz/WFXPrTYqjcBAiHqAg3hqAt2HEa7q9E04eK
         29RuhhkfNDtV4LKaqtmRRe21BiVEsbco6BNJ2PdTSsV0HPmqxwR9bZbhHOPpQ/VHnLpP
         LY9uv2DE78N6p8pzq7RlkXRqmrlFl1YxdWayxlMnRBrmlNmAAGoMicflHpTSt21kOZUN
         oT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738371050; x=1738975850;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rxeqp0iUagZtsoZjwTJV6Mkmpp79QeV032AbydK9elA=;
        b=j0bpwVBEESDU43D4tiaJoCtdPo/qOkMAO6M1dV9xfOGIblaNao+LhFNUSEfRPLg4w+
         NfcDZM/vkas3LWXWKsQFW7Vw60rX4y5pRqTTlQQOejee88p6x4tu65m7c4rpyXAQ3cbu
         RKAuIS4xcZLJOTgksOf8eGvtQV3M4n9Mf7bBmuBpDujsFfzAbUO0GXIJ8V/9yCD4AzlA
         6hETKhAVuxrzN1VCJVjlluIXHW1nvNHMLr7Zif3PzLkKU/z5tQC88TaPxhDNmlLELYE0
         UEgUEVuf16CzIOIDZ258PF/rqKAo7ZpLZO7PF566k7OBNbE1CbnqZbw+hKR448OjvazF
         zTrg==
X-Gm-Message-State: AOJu0YwQbmTC2CjJaPLFjbLEQi7zJEHdSX+H5N7c5H3ARHMSyJ1MTuMf
	PpQ/BoCf808Xuzunlbk9UDUvcCefsDTPvfRu60KnnPdBYZ4J8KflTQKmHekmvoY4eeMbq+H5D8s
	eAA==
X-Google-Smtp-Source: AGHT+IGiNBcI+RlVevJWnt6K4utvGgac0CfWKiu+g4D6W3FFH7J/4bdp2RMxOyd7HL6C4CLLNsBdRkjRihE=
X-Received: from pjbqb8.prod.google.com ([2002:a17:90b:2808:b0:2ea:6b84:3849])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2742:b0:2ee:f076:20f1
 with SMTP id 98e67ed59e1d1-2f83aa85095mr23559697a91.0.1738371050295; Fri, 31
 Jan 2025 16:50:50 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 16:50:46 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201005048.657470-1-seanjc@google.com>
Subject: [PATCH 0/2] x86/kvm: Force legacy PCI hole as WB under SNP/TDX
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Peter Gonda <pgonda@google.com>, "=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?=" <jgross@suse.com>, 
	Kirill Shutemov <kirill.shutemov@linux.intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Binbin Wu <binbin.wu@intel.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Attempt to hack around the SNP/TDX guest MTRR disaster by hijacking
x86_platform.is_untracked_pat_range() to force the legacy PCI hole, i.e.
memory from TOLUD => 4GiB, as unconditionally writeback.

TDX in particular has created an impossible situation with MTRRs.  Because
TDX disallows toggling CR0.CD, TDX enabling decided the easiest solution
was to ignore MTRRs entirely (because omitting CR0.CD write is obviously
too simple).

Unfortunately, under KVM at least, the kernel subtly relies on MTRRs to
make ACPI play nice with device drivers.  ACPI tries to map ranges it finds
as WB, which in turn prevents device drivers from mapping device memory as
WC/UC-.

For the record, I hate this hack.  But it's the safest approach I can come
up with.  E.g. forcing ioremap() to always use WB scares me because it's
possible, however unlikely, that the kernel could try to map non-emulated
memory (that is presented as MMIO to the guest) as WC/UC-, and silently
forcing those mappings to WB could do weird things.

My initial thought was to effectively revert the offending commit and
skip the cache disabling/enabling, i.e. the problematic CR0.CD toggling,
but unfortunately OVMF/EDKII has also added code to skip MTRR setup. :-(

Sean Christopherson (2):
  x86/mtrr: Return success vs. "failure" from guest_force_mtrr_state()
  x86/kvm: Override low memory above TOLUD to WB when MTRRs are forced
    WB

 arch/x86/include/asm/mtrr.h        |  5 +++--
 arch/x86/kernel/cpu/mtrr/generic.c | 11 +++++++----
 arch/x86/kernel/kvm.c              | 31 ++++++++++++++++++++++++++++--
 3 files changed, 39 insertions(+), 8 deletions(-)


base-commit: fd8c09ad0d87783b9b6a27900d66293be45b7bad
-- 
2.48.1.362.g079036d154-goog

