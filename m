Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65882EFDA8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194072; cv=none; b=PfDGxwo+kscPSJ+P3xFmjTtFaX06CKs7ZYhPWpu1motfm+7jI7KBRRPGHlglInnVZBTBMsvD7i5JHMi1KVb9Cx9d3AgqjZ70UZuDitnbsP2triqywunUHKhNNb29OePZkTfZT5B9Zz9zw160LTNOencW8sf18rb7ZOInS9FkMig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194072; c=relaxed/simple;
	bh=avEJxZ+89MufZP0SLyU7euqYnGXLsVOUMkRS8Ko+SH8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XguAgVVhtcMteV6tHPhAeARR+pe/iswGuENDwYT0L9WXooQxWVosMJ85ggpTb9Z/johWrU1rOFURauzoCgZx8mdDOp+LC0LwHDSqTpo5IAa705K6Zqw9rdW1exT0R3bZc1WOG1Ve17w47YXMWp1sZyNmtlimIBvqX3FGVpWhDdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ePieN2wh; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ePieN2wh"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-312df02acf5so62544a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750194070; x=1750798870; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWy9lkoAMNiIrASQ8hATfQAjClcrpl+Y1yZ0Ab8XMS4=;
        b=ePieN2wh8gC7ItDJ2jPbSEuFL2D21fJ+9UErWN9MqgNRdGnn/oxqNHXViCItI6mxi5
         1oRAGtxEJKC/UdG6vbtom++QL1fWNQuRTKfj2ZLCLq3q7Tk33Cs4qtQWTBfGzSdO+4CJ
         msOQgmwoAyoXPfB2e0HROo73O6EH2PYxeAQd0m2TohKRTGE/+MjKDDYzi9GoY3L08EAy
         rsyCx5Oz8wtJLKbv3hrG+bNOhADFR3+qni8u+0BDnyzGAdkDMDENFCUb5CkDTqgTJN+A
         91JmWSzaiVwL14hxkUatbviXDy4OkQILdFG/lU+s9BUFiT/3AxKfGrwKiMkK56j9zf7Z
         4rVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194070; x=1750798870;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TWy9lkoAMNiIrASQ8hATfQAjClcrpl+Y1yZ0Ab8XMS4=;
        b=tuBHc2JEqiFZY9zQZH0cnOwmszn57fprwj6GcWcCwKBskmwDAz5+kvIL6G+5e2rd4H
         vK2378mWtUHzB2DPpMKWVTzu5kCZVD375uKcwCDoJ5jpv0NxShgRRMIi4006meBLh+9q
         MFkPzCVAV/A+DYHrRRTwkqaFSipm8Q5jb5iWrk1re5DmxPsy24Z5bDenQZTOISQNDk6Q
         YLhm3QOD/iU+tItmY4dyInOpseGUyfrgBSMdsqh+H+duYNecHlVXfewlnRnlpUqIxP6a
         4VSWH5Vmu5q+CrSq20urJmqnq/Pcc3eNRbFXlkBF9SeIDutP9jMjjhMc/op7yzTyODMd
         lVIA==
X-Forwarded-Encrypted: i=1; AJvYcCUmmFZqMe8OWpwhmy4yyDuFDblzmMVBFQVjyfFNDpg50PmTjJ0sgUOUS/z+hK4Qax+0saPt3YQwA4Y3Qpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YykJPr91G9a7nZZoH7wxnuShC3vrQI2pDFTyDbHO6AYe9LF8LML
	9pyE42xr1nu0fuwh4g5WT5OWhY0uV4Bc+cVSwGaZs3U3+JEgH7+nY9tmxxLZ5eAUgjWRSFWAvGH
	l0eor/g==
X-Google-Smtp-Source: AGHT+IEE4tk5CdXgmXoq0+BZG4nzsKOX62wsnsfVghGqvjHwEY84uaPun9CQUeH3vVGqWrPA6SHXwsPuLAc=
X-Received: from pjbqa3.prod.google.com ([2002:a17:90b:4fc3:b0:308:6685:55e6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:ec8d:b0:311:83d3:fd9c
 with SMTP id 98e67ed59e1d1-3157bee54a1mr113685a91.0.1750194070127; Tue, 17
 Jun 2025 14:01:10 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 17 Jun 2025 14:01:00 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250617210100.514888-1-seanjc@google.com>
Subject: [ANNOUNCE] PUCK Agenda - 2025.06.18 - Any topics?
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>, Jon Kohler <jon@nutanix.com>, 
	Amit Shah <Amit.Shah@amd.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

I won't be able to make PUCK tomorrow, but that doesn't mean y'all can't meet
without me.  I _think_ if someone hits "Record", it will show up in my Google
Drive (because I'm the meeting owner), and then I can get it uploaded to the
shared drive.  So, someone just needs to take charge tomorrow :-)

Alternatively, if no one has anything to discuss, we can just cancel outright.
But IIRC, Paolo is out the next two weeks, so this may be your last chance to
pester him for a while.

Sorry for the late notice, this week has been a bit hectic.
