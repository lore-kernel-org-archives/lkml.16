Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EF11B87F2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743763280; cv=none; b=qYcJ5yDIMiPozAnRypWUmHJsAyuAX06XCV9gUmwbatCjKSs3gv5I2fQSX+EV0KuM3UW7ajrl/YgPkdutrKtTmSWpVI2cqTfqnUPPJ0SZtwWjxFQk8i8LXhWCa08C9pVfStKhMz3SFxoal42/hof8TocJzOPC+CBM9h49LmSjVB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743763280; c=relaxed/simple;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=usLF5DoRxC+n6r2DWW7+hi4MzthgHxAZZdHgqmuEv7tsY0w7yadvpcZ12CJelSrNfQG+rrXja76MRaUsIRsXIIT3P30aqKl070vskrVjHOgUKAdSl/gAvK3LArSusFv9+WfNNzBzKi9YUWP8AAKHg3c/OKtHl2MbhfzXDe9w2hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LD9Xyzpf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LD9Xyzpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743763277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=LD9Xyzpfffl6hx7pv0Zlmy211oU/cX6gGcnywFP8dGCcCM8568nml/YzKVbnSOiPlk989O
	C9+HZUCNE7/Ikf7zteaaU2+r/N+Cb8yMPJu2rTdPigxGwivjA84EcJARrrODEIL6z8TJhQ
	oS9+CqDUNUOy92VbgV7rn0/QyI21gNo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-52-RX6RD0w9MKSLnEL5vcsbbw-1; Fri,
 04 Apr 2025 06:41:14 -0400
X-MC-Unique: RX6RD0w9MKSLnEL5vcsbbw-1
X-Mimecast-MFC-AGG-ID: RX6RD0w9MKSLnEL5vcsbbw_1743763273
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0A8718001E0;
	Fri,  4 Apr 2025 10:41:13 +0000 (UTC)
Received: from virtlab1023.lab.eng.rdu2.redhat.com (virtlab1023.lab.eng.rdu2.redhat.com [10.8.1.187])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 03C241955BC2;
	Fri,  4 Apr 2025 10:41:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: Allow building irqbypass.ko as as module when kvm.ko is a module
Date: Fri,  4 Apr 2025 06:41:10 -0400
Message-ID: <20250404104110.188205-1-pbonzini@redhat.com>
In-Reply-To: <20250315024623.2363994-1-seanjc@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Queued, thanks.

Paolo


