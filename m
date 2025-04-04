Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF7833997
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743763140; cv=none; b=NB+nr4CCMmD9qAcb6vLFYfS+DVBhqg2bNLobjP47rjMiC19z6uwQN47YC582fkZmdV7oFNiGb5UDbAwHYiQKgecBWba4ze8Ps9J/maaf7qS/yVX2sIqbgPq2fh/zdvMCAytE+kg2yIb9gTu6LXzeMyDRC6DOr0H5aHknlqh5Yqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743763140; c=relaxed/simple;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyM2TIcDj874+cVmL/ZKJ0RUm0dj4HPZK3Uo3OasJFrDIRQzrgeb015xXn692+3wG5vd/1e3uuOmaUh7Apu3oKzyICwHlss5hDXN43GdBlXV1QcGEZdALVN+UrzXbpiii4X3fvozfZwa8p+8MfHREd0S6tEE+Zuy5JxdMnekIl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ESN/8jiy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ESN/8jiy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743763136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=ESN/8jiypF2kkVAFmdr3MeS71Q1QFWnfBci7F//tqECC0FklFQYA7wBkC4UuOv7C//d0rU
	tlTRy2U36X+tVBxMd8nrhDyRize5QvY2ayAuL/nOBt4opp+8nUFHyotPCTvrHhwXR9jFE/
	OFCgegQ+h5cwHbDt8WpPG4YfjdgAk/g=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-147-VBD95XQ3OHOpaN9246N_MA-1; Fri,
 04 Apr 2025 06:38:55 -0400
X-MC-Unique: VBD95XQ3OHOpaN9246N_MA-1
X-Mimecast-MFC-AGG-ID: VBD95XQ3OHOpaN9246N_MA_1743763134
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9338C195605A;
	Fri,  4 Apr 2025 10:38:54 +0000 (UTC)
Received: from virtlab1023.lab.eng.rdu2.redhat.com (virtlab1023.lab.eng.rdu2.redhat.com [10.8.1.187])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EAE2C3000707;
	Fri,  4 Apr 2025 10:38:53 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: x86/mmu: Wrap sanity check on number of TDP MMU pages with KVM_PROVE_MMU
Date: Fri,  4 Apr 2025 06:38:50 -0400
Message-ID: <20250404103850.188049-1-pbonzini@redhat.com>
In-Reply-To: <20250315023448.2358456-1-seanjc@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Queued, thanks.

Paolo


