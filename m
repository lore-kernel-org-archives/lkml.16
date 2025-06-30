Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935596BFCE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751251541; cv=none; b=u48QLJfCOprny0y/MTkfzf4lHxHnHgaCNpvtef9FbwTKKbdMX+5VyOS9O5jQBXDKEyAgwwh2COzNatUklDiEsdVh26jByCcLOz+R8h2Hsival5lY9W7WdYKIynwn6hlB9XXrwuHk7TdUClQe76G1vzlBEy+PKTvRTgvcVpIYra8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751251541; c=relaxed/simple;
	bh=UHNjZp9vnc8N0fE+mqLUroxaGrEdiH+dy5HU8/n87p4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SixkQ58Ub9HFRxnYBsyaOag511zgmNCF/jW2u1L6VRqrs9GC9EiUElFuNFk4JozuHdhHpCOQGnX9JLpi973+DbMTsPc+J90Lm8vYTyurkhwlh+68DwBSoDW2j3CyCAk2u+1iPkkVVLNFop72MwxkwA1/NDqAg77IixjqeDT4GzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BeRiULvz; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BeRiULvz"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23aeac7d77aso10548065ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 19:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751251538; x=1751856338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eh2c0RNhVOz1J8G3YkRJ2Bdd8xTOnKuaM/L2dwLoys=;
        b=BeRiULvzpWO6jNpWdQwr01JamXztuAbkA+VZYdwrY9Kd20L4gZSLs1hgVJlfjWo6Sb
         g4IBKG9G7/rPgnHyBDHiMAHDY7YSPtfyZmI1IMO7lQPNXAKiISTQeZf7XY+0OVVt8vVy
         znjEx50EgaKxplVQ5X7JZf6RBAWyQBCgZpxEaNULrk1a9SZ3+0DWwA/jehJdGXAJ5nqc
         ULdWZkNvd6w+5QWiVuQjiHmSuqtX18QlOaQ+AUJibUssxBOJRqioH93f8HpONqpckqTb
         vCModUw/PKzFGxVeXSAXVzbtJgt1mqhvXWBpM8TIe9M/RJlbNRr9MF2WFHCnps9CgSC1
         leiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751251538; x=1751856338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eh2c0RNhVOz1J8G3YkRJ2Bdd8xTOnKuaM/L2dwLoys=;
        b=HkHcP1VE+Qi4dCgAJ70QRyKh+5hvhv+LDCwYdhe/q2lF76LxeP+0+KRBnBngDV/jmI
         MB7+lJ5nJetLybJpwyhFIHIM2b1H1Kv0serXGgs+8Z5wgAIZZWJXtT9ilnbBIZpNRhjj
         9cL0Wm60TYDMIaTJeqqclk5xg/+f8m/zXBb+U9R7hS/umnTsVDWxmZmhrelkFZ6PWlO/
         xsRFijejwPLbS+frMYYbkV7N+GQLc8mnFqAPq/kD5QDWBno5NB9OYLqqp+jwN5ErthS6
         Ic7AWG4+4yNJWV8JG1lW1wc+fyWoWt7+3svhcKbN02O9b5xnTZvR1UaYYT+XKzkhsyZz
         ul2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDmY9sM0ns1RJrNlr11JAJC6oBukAjaUXGd4TOxDh3rqk7vx53Lb339eUguRx5dNGK3M4mIKiygReNpFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfjobtSXWdgQcvUz8BSLrBMvTA65MLKXG5VAcXDAAU1kxIEJkl
	sTpbUP6r0tCzg7XNYO+QoqsvdB0g9YvKs9sgUriw6Fd1QAMDLyXVOY2ehlDdMmb5wDo=
X-Gm-Gg: ASbGncto16Nypw15OJX/rlgKcjO+jcnOq+BhX6iPe7ZczCHb6oFAimiWN+Stgq1Uwwf
	V9kBUpbpNOxcp8JsynPiMzvW72VH9uZTDuHHK7jIy6zE9gv5qt74/+syKleKAgmYd9XQGFLFyGv
	eK0KxXRZ6qVXLMDs/Fq3OvqWPK+CmoCIGE9CvRlUivgxrhY9JWb6eYlsH/ZHk33I7jTu5M6/n6S
	oaP9dZb2VSaHOzjMbvGe9qpzHRrAL5kuyscrSai9ry2BWx9QWcsm4dORa16QSs0zdi8sesF4C+I
	eJyHnjPS7n/m3a+TkRXdDv476VE5RwQBKm3/XYRZVGCjlUQh5/KKbMFNIzEXJSBCUpU/J2xK+xX
	9LiGEQs4=
X-Google-Smtp-Source: AGHT+IHkMW4IThiZ2urOldb1y5zT3OBTJNJjaWpv+ESNfp/34TTRddvqxjqDrw748ODDT4UHRObB2g==
X-Received: by 2002:a17:902:db0a:b0:231:d0a8:5179 with SMTP id d9443c01a7336-23ac3df2193mr178800645ad.23.1751251537746;
        Sun, 29 Jun 2025 19:45:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:c10:ff04:0:1000:0:1:a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b7915sm70255965ad.165.2025.06.29.19.45.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 29 Jun 2025 19:45:37 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com
Cc: david@redhat.com,
	jgg@ziepe.ca,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH v5 1/3] vfio/type1: batch vfio_find_vpfn() in function vfio_unpin_pages_remote()
Date: Mon, 30 Jun 2025 10:45:31 +0800
Message-ID: <20250630024531.12377-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627154059.0e134073.alex.williamson@redhat.com>
References: <20250627154059.0e134073.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 27 Jun 2025 15:40:59 -0600, alex.williamson@redhat.com wrote:

> On Fri, 20 Jun 2025 11:23:42 +0800
> lizhe.67@bytedance.com wrote:
> 
> > From: Li Zhe <lizhe.67@bytedance.com>
> > 
> > This patch is based on patch 'vfio/type1: optimize
> > vfio_pin_pages_remote() for large folios'[1].
> 
> The above and the below link are only necessary in the cover letter, or
> below the --- marker below, they don't really make sense in the
> committed log.
> 
> Anyway, aside from that and one nit on 2/ (sent separately), the series
> looks ok to me and I hope David and Jason will chime in with A-b/R-b
> give the previous discussions.
> 
> Given the build bot error[1] I'd suggest resending all your work in a
> single series, the previous map optimization and the unmap optimization
> here.  That way the dependency is already included, and it's a good
> nudge for acks.  Thanks,

Thank you for your review. I will send a new patchset that includes
the latest optimizations for both map and unmap.

Thanks,
Zhe
