Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8310F198E63
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762568; cv=none; b=no8FoMhAH8U2t12eqTHmzifIQCZyvSGO17iO4bIrvS8Wlz/772hdo8s37MQI/zdUAugPtveCw12PavuWS+6d3o2tUUlgQBU6EH4CU5RE0NhY9Dwl1nf68G6cxaotRo2Y+0WGvSD5wDhWMuHJ69NjTz7UaYEzM1wVf59IMjoGJwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762568; c=relaxed/simple;
	bh=4tdmetf1lCXliEewrbfbIOmwuXj1mc0LGbqbXi+55wc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=obpBSNdW8CCSjC9BO0ncll4EUq3dAUp9rn9jwzaSbrhbNrU7kSWrKYFiUYGeZ19cf08YUgHX5sNBsC4h0msUYYYNyhlWtTKwV5Stb0KW36ipksj2PaFTZzk09jduaqywQ1LSYtzhPT25f+WUHynFDO+bhhRGHXhAuRdCBO0W6ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IIyaNQ/c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IIyaNQ/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743762565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T6NquZdovmTMsUinuO4eB4LIwS+YsKGYMLukNBFuSdg=;
	b=IIyaNQ/c3gppgtOnh26zi3fqEDbHl2yqc+cWA52l69TG08x16tgNrWaMKtFT1YWTQj6KEe
	S1/p7BYQX4fnzr7+vxYVgBIPWPotd5roRp7WC9zEbZO/Ryi3qeJBUyEGfes1F1NaEqjvNi
	+cZk6Eo/LIbvU6L3mLrEt1l1RcbBJ7w=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-lUt2h3zuO6K2LQcnju5vVA-1; Fri, 04 Apr 2025 06:29:24 -0400
X-MC-Unique: lUt2h3zuO6K2LQcnju5vVA-1
X-Mimecast-MFC-AGG-ID: lUt2h3zuO6K2LQcnju5vVA_1743762563
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac37ed2b99fso169928166b.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 03:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743762562; x=1744367362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6NquZdovmTMsUinuO4eB4LIwS+YsKGYMLukNBFuSdg=;
        b=bZcHMZ1MtgVest2rIbNNiHGNYQyOKgnF2cXG+lluRdwdLHDFGN3HOgQpmHdV2exfid
         6WVPtsEAM8FAhht0gqfpsovhButDLx70UGSdyET35cxEh4lajDfzav+4tRvMef37HZiJ
         4Bmi+cVXWgUlkYsVzlJSocAfLqtaRQ58+ugEvJI0tKT1GaUwY0kixGY4nraA6UO2IWVu
         P0i+n0G2C1QLg2z85PFNFWKoQpHk/vZXIoIaxVBFVi3pCDaFZT0vwlK9hOLWuXoDZY3r
         xJYVbIZWcvFFXnLcNRQcOxJGMZi+nQQQw/T0+fBZmS0SEsXk7lu+XCgR9t1R5ljSD1WJ
         rlAA==
X-Gm-Message-State: AOJu0YxA7ujffJQoy754GKCF+Uaz8pa+PklZwlpcKMP8xDzeo+CCOpGX
	iKsfHdABMJNuNZZzo/WbFy86qro9Uys77ouBjbqrXHyDPNh9ic160mXkLKZU45JQSR8I+35pJV+
	KgDLFDJ0Vr2bzIAhQnSDAH8Q+M3aN1Zspu+WDfl5ANvN2r44Wx/hGRSUdBRI6RfNEMOKaRUAqjd
	y1FA6xcMwdpabgjKJKVv/UIPsaWNV99cKmzlZ8hlpMcV33Xg==
X-Gm-Gg: ASbGncuf1Dz5OgUVe3JeWsTWnQuv6PijUcD/zBVD3PyegiWwU8ap4PgSxO5iwR3LAVK
	vb73Gzg24Ulx16jTDJddaUzBb9kqVVlwTfy1/2JkXPyDyV3H0Mf05gaqwhFB66eewQrkGvYTfgv
	CpzEc5hv+Yl5JpSTaOsY+CDwmqs+QOM/+ls7jBDZYs6t0cVQ1/nbKpNExNYEjCVSk9DJnRYCnhM
	Kkmc4Wu53IO2OedZIpSh70l9b5tvkdagOYF265IgAd/k4aj3DDX6eNOsK/PTZAZUF7rECE5xOYJ
	x7xTDO/sTAR+8RA3lB9k
X-Received: by 2002:a17:907:970b:b0:ac6:edd3:e466 with SMTP id a640c23a62f3a-ac7d6d03dc7mr161145066b.19.1743762562307;
        Fri, 04 Apr 2025 03:29:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfA32d489HvKK0l5PnqVrR3kR//7KWWZo584P/Gc87QpdSbTdgAfAHbKrKml5QdqYMR+aH2Q==
X-Received: by 2002:a17:907:970b:b0:ac6:edd3:e466 with SMTP id a640c23a62f3a-ac7d6d03dc7mr161143766b.19.1743762561960;
        Fri, 04 Apr 2025 03:29:21 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.230.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9bb8esm228306666b.48.2025.04.04.03.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 03:29:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH 0/5] Documentation: kvm: fixes for capability section
Date: Fri,  4 Apr 2025 12:29:14 +0200
Message-ID: <20250404102919.171952-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several capabilities are documented in the wrong section (6 is for
vCPU-enabled capabilities, 7 for VM-enabled capabilities, 8 for
informational ones) or have incorrect information.  Fix a bunch of
things.

Paolo

Paolo Bonzini (5):
  Documentation: kvm: give correct name for KVM_CAP_SPAPR_MULTITCE
  Documentation: kvm: drop "Capability" heading from capabilities
  Documentation: kvm: fix some definition lists
  Documentation: kvm: organize capabilities in the right section
  Documentation: kvm: remove KVM_CAP_MIPS_TE

 Documentation/virt/kvm/api.rst | 1104 ++++++++++++++++----------------
 1 file changed, 540 insertions(+), 564 deletions(-)

-- 
2.49.0

