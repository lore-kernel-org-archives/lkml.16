Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BD11B0F31
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762932; cv=none; b=eRGwQHnDnbcc5SZVPDqUxbxO3n6/UEsEwQ3KosuyirKi/mKhDprQFeTjUHafHJbwuBzE3A2rlq5nNpZQgKJcP/Vcee+K5aBKU8YwpbWMPzyPuFMIwUUm0vL1ZIkVh3FCwHLtqUn9XOoiTOnHJWNqYqb0WWpijaopZIBO/pSJSpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762932; c=relaxed/simple;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OIAzvMiLx/1wgeTk1B4HIpPotLjF8XRuZCZLVRmKRjaBRrNMcP28OeW50pd9X3l9RjvnJ9UBb3tAhZH6mdGK245ddZgTQ26YOKN2WJo0NtOf/ZdnWqVnTQnKGSMom/CNWhzQZpIon/LcT1cojLSqj4FBPC1gkinv3YEO0nPJyO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PuWgGq3c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PuWgGq3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743762929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=PuWgGq3cdJMpMbIPKwmdyIzTDa0M2nu7SxKKl/Kb/F+SynSM5q4/FYFrNwyTD+5v4FtoB2
	Q6vtOdg3fT7y6kzpHaPjeR/a12kNGrlC2wg86O0U/CAkVxENCOMyUPOO89KYAF09qNjlqs
	hk89icORKDx6KAt+siNZxYnV+e5Ne48=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-156-92_U0mAtPtOaggcWyRXsug-1; Fri,
 04 Apr 2025 06:35:26 -0400
X-MC-Unique: 92_U0mAtPtOaggcWyRXsug-1
X-Mimecast-MFC-AGG-ID: 92_U0mAtPtOaggcWyRXsug_1743762925
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B2201800260;
	Fri,  4 Apr 2025 10:35:25 +0000 (UTC)
Received: from virtlab1023.lab.eng.rdu2.redhat.com (virtlab1023.lab.eng.rdu2.redhat.com [10.8.1.187])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 80CB8180A803;
	Fri,  4 Apr 2025 10:35:24 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: x86: Acquire SRCU in KVM_GET_MP_STATE to protect guest memory accesses
Date: Fri,  4 Apr 2025 06:35:20 -0400
Message-ID: <20250404103520.187815-1-pbonzini@redhat.com>
In-Reply-To: <20250401150504.829812-1-seanjc@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Queued, thanks.

Paolo


