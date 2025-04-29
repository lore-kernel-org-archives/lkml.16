Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1519A24BC04
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945558; cv=none; b=E3hzLc5yp5aRCOjXBkZAZkbzVkEh3IhZ0F11N/dtlR+n/j+uv7sQAT42CT3TUPmV/y8paDsf6l5fJoUIuYDAX+/3qZoP/5o+8PFOZbIUR39StND8fuGZ1v+pOtVF569ZpJSdWNXrTA50b4fPkRkPqtuI0VRCXNAfix4J3ZeHzts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945558; c=relaxed/simple;
	bh=9/DyTaXRRRhmMtYj7n0VE2ZpY/dcBTLDTDYYO1pk/Ks=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Qkb0tNMdBOJ08rWRsVXF3+t79Egac4mEGwZqzXzUVuW/abFxbfEkkhi9CwuNAKkpo7EGBylg4FFbJNMTSdI+NeLsSiy+4ddKizmoFRDtgeaXq2g79rxE7TV+DLs2BXezoD5ENd8Q3Eh1219Hc1cPDmM8xSbkST45E4iyEhKg0ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=biT+Ta/N; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="biT+Ta/N"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3086107d023so5389624a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745945556; x=1746550356; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/DyTaXRRRhmMtYj7n0VE2ZpY/dcBTLDTDYYO1pk/Ks=;
        b=biT+Ta/NIhhq59VVxrszBNMy57vHcDctJN8ACrHPcI5+krqhLahkm6SdKkA/jnHuQz
         zOHWWbhPOCXQQcHQ3NmHyxQSNjg/9wNaJmKROe7EPnUOfMaCAJWVCnfuFynCUNKleZo9
         ni0wl2GZmJFh4yslLJR5V//hZIkD/ytn9SfMIjxQ+JDm/IPOj6MHq2QX6AlAP2Shs2+2
         RYR7iilsQ7AksezOr4uyKbwLRpXyUP19q7+SEx9p4L64gN/7pDU6vrFIJJ7+Octr9Erp
         1nsN8qP79WHSIfZ+xxDO/Tcr9b1wfqGak3/ts9rHGLoNkVMzPkuDUaQwy/Jh+YrTCZNZ
         iqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745945556; x=1746550356;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/DyTaXRRRhmMtYj7n0VE2ZpY/dcBTLDTDYYO1pk/Ks=;
        b=NcPsRnxox9dWgHXTP8QSYL8T8p9HoZp+WsE9hGoieF2IsdWYSeJONOLPLcXoU+pu42
         M3MRsGFegz5tHLT++xWOZuR1O0GsSY+2gyf2maElIrb4/kyAQ2GeV46h+jJ9xHdpo/Qu
         ObHAxOBQkKlyJY+nRdPvJceytMn6TB1oRalFjUms+XcU6ilqxyWqRXw7NS0IUIfvGIzY
         4vbKn4IgFaEGI4YfHk7h6uEHD4gpC/azMc116SnwWe9BrWkOPCpg4twQXfg0IS/PNA5W
         O/tmx1L8J39HrMzpgED1NetZuCdKhdqrRnts8/xkPaUnYkvdpt8+bjqQly2/siVi822Y
         AlJA==
X-Forwarded-Encrypted: i=1; AJvYcCWaZeLPlIbzjAHIQ1edJJlQStXNHcKz/8aHmFY1nLTE3GjarrANRd3MLm0Y8Ev4XYYSlnP60lEnTktRT3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC3BvtGRHqi+zVTyQUpq3Ihbya7iPaNJYJk4e0XTLdKzwOZW3Z
	PAgDAMQCoM7qZ4V6SQOAC9p4EHR8vzydiI94AsgR2VxTasD2v7pK4xNUzgpeWfwhr/Ay8pqvP3Y
	J9w==
X-Google-Smtp-Source: AGHT+IFEE6LO1G7pamWoVl2A8JQIOWisDuS/kml2oFH5sEgf3g81yBC6JuYkTpidKh/jeQ32pw+x5WUisOE=
X-Received: from pjbsy12.prod.google.com ([2002:a17:90b:2d0c:b0:2fc:1158:9fe5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:568c:b0:2ee:d433:7c50
 with SMTP id 98e67ed59e1d1-30a23e262eamr3924343a91.23.1745945556371; Tue, 29
 Apr 2025 09:52:36 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Apr 2025 09:52:27 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250429165227.153943-1-seanjc@google.com>
Subject: [ANNOUNCE] PUCK Agenda - 2025.04.30 - CANCELED
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>, roypat@amazon.co.uk, kalyazin@amazon.com, 
	Fuad Tabba <tabba@google.com>, Vishal Annapurve <vannapurve@google.com>, david@redhat.com
Content-Type: text/plain; charset="UTF-8"

PUCK is canceled this week, as I managed to pick up a conflict (at 6am...).

Future Schedule
May 7th - guest_memfd initiated private/shared conversions (tenative)
