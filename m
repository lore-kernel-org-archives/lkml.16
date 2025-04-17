Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315F51B87D7;
	Thu, 17 Apr 2025 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882504; cv=none; b=BWK59by6Dbw7n8LJQnTpmSOW1ssuABTlah56gvmjkDcBSg+HlZqJQ+dkWJOJ8cLWzaNQLWO9FqP0taTCE0xbdtZiGmPTv72TJVz85uF4AZL0Ak1GxXBBuzkHxwOGNaz3Gd6rGvNMS8J6lRjC7id2Nqz5Q0Te3o+z4ZITMVEjFyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882504; c=relaxed/simple;
	bh=puAncjdrJIYivSStC6bMmmSe2HQOLNEs7wZvk83opf0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cPbnbQ6rHBwJ/fhIuZqwvJYAm0u6hC5Q2u4v4z+H79qG/WyQi8JhJGyGm9UaRMcI3i59PFqIsFd+V/AxxvU6qkMPbxfKAYwPxPm1N0A6KRUCAWFucU2gUsf57xrRO8Bzz9sRuUj6JH4QAB/LssM20XaVDirQNc3R9HFBEApSgPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6DdccDv; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6DdccDv"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54c090fc7adso634488e87.2;
        Thu, 17 Apr 2025 02:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744882499; x=1745487299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+5aszhxeO4ttjGg8YIezkMH9b8PYdR7G6wpxxxurAI=;
        b=B6DdccDvuLMAm156O8n2J/xcPHS7WHoOQdmvlpq1rT3PkCYIhkD0e14E+qCCR/jU87
         WqQ0dGO5+3koT7+bWS6b8qVeSPG1AMd2sWdiwqHanSDgY/D57fVu6mlKbALiKeHn0Kg8
         C+soD/AxkogwCickGfeKu9hZW4IipHyKwP+WpveNdSUpq2SBoRK2/rpeqcJ1+ikI3jIe
         NfZP1hv5am7zH6WZ66u/nL6apdxPDMREnBMvIfU1PkjSPARJd236fdTn623PEKilzd/D
         3U9hqufzDpm8f4cerSBcUxkST2cGxxesZBrGrTPhTEDQP+q/a1Tl0FMTUzea4PO2QUl3
         COsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744882499; x=1745487299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+5aszhxeO4ttjGg8YIezkMH9b8PYdR7G6wpxxxurAI=;
        b=HHkHAoPyz/5D1LdM5APiaKxNtPI566jl5SBAA6/p/0I9MPPbKkqDi6qA1EEblUDC9h
         4LtFLyADtH658SoFT+DwShNE60kDICJ457f1VWi71zK6V4AoL2uPbSUlZoVKZQvdh3Pj
         Gg+gnRh8HrxhLGpxKwpaVrZMDJxfNQxZJrC9obk5Ue6fvMiV9kIgjUSNyldx+SYU+hQe
         d1yTwKwOjM5HgrAco9DJqJ/wnt/QKxX7jTeDLrg/fM2n3Rj0yIcQVV1NW9kzs/pCIr0p
         6OOR2HJqdr9hc1rGtGuLTc0ZxEdG+cKP0VShxE1+U9mEBgj2rRopp/WW/B6R7MlgfkUq
         p7BA==
X-Forwarded-Encrypted: i=1; AJvYcCU7ofxQ5uFcCK6xsmnWbUPenl8QjmszG1DPuZgb/Uv20MOFAMCDKLte2CH/xNAoKvFkqN+rphI8uK7o+ko=@vger.kernel.org, AJvYcCV4/1aSz2TQJpI18YO2bbkjHzXsN1raRUGMFfj2GMLmiD29GFX5ki8rmRNewVL0si+aodD49vP7CTtG@vger.kernel.org
X-Gm-Message-State: AOJu0YxFr71Tp8Vvkck0l1D0wS71AY25OoYYThoJH+SYJRXcTXYoQ4mC
	WDRtsBMW737QaHpiAJvq2KoEUiujILl264iBS2R8qidcTN3VwRrA
X-Gm-Gg: ASbGncvUrTLWSK1jQJvBjbrn7kXWJZ4x93wa3ZPnlbkiH2VB1wJ/fn8vz4zMtt4+sQi
	VH9gxXj8mAF/ovs0S8vEMu5sI3YAuNegiKBt0cRhBaiilncwfyp2TFIWjE/pR4Ghclnxdz10XXF
	MMh3K/yk3vlvYK+d2nPnoX4ZUGwNc2HNSDQgpeb39D725YNHQ4j5ZCWstqmrAy8ExUNo4Nd4NPw
	U+oED10lzyW9csbb6zrgdJxPryfdWDfet3IvZBgD8I1J7B2Qgpy+b6Fv0Ge1NLXbtrvZZ7uDO0I
	X2Kz1YolrqsClUE7ga66dA/rNomMVH4/k79AAfjyaCMnPJu/HBTRHs3U0Q==
X-Google-Smtp-Source: AGHT+IHzV+JwG3N3Edl8eTVB/nvfRd3Nbv171is9qpuy4LDFkI44SeZzcDOeHRSRgInYPSiZkomsWw==
X-Received: by 2002:a05:6512:118a:b0:54b:117c:a06f with SMTP id 2adb3069b0e04-54d64af237amr1724851e87.56.1744882498956;
        Thu, 17 Apr 2025 02:34:58 -0700 (PDT)
Received: from foxbook (adtu187.neoplus.adsl.tpnet.pl. [79.185.232.187])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d67a355f5sm270958e87.165.2025.04.17.02.34.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 17 Apr 2025 02:34:57 -0700 (PDT)
Date: Thu, 17 Apr 2025 11:34:51 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Minas Harutyunyan <hminas@synopsys.com>, Linus
 Walleij <linus.walleij@linaro.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: hcd: Add a usb_device argument to
 hc_driver.endpoint_reset()
Message-ID: <20250417113451.09ee5472@foxbook>
In-Reply-To: <fac2fc0a-8352-4036-80b7-1194ca382f70@linux.intel.com>
References: <20250415111003.064e0ab8@foxbook>
	<fac2fc0a-8352-4036-80b7-1194ca382f70@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Apr 2025 11:54:19 +0300, Mathias Nyman wrote:
> On 15.4.2025 12.10, Michal Pecio wrote:
> > xHCI needs usb_device here, so it stored it in host_endpoint.hcpriv,
> > which proved problematic due to some unexpected call sequences from
> > USB core, and generally made the code more complex than it has to
> > be.
> > 
> > Make USB core supply it directly and simplify xhci_endpoint_reset().
> > Use the xhci_check_args() helper for preventing resets of emulated
> > root hub endpoints and for argument validation.
> > 
> > Update other drivers which also define such callback to accept the
> > new argument and ignore it, as it seems to be of no use for them.
> > 
> > This fixes a 6.15-rc1 regression reported by Paul, which I was able
> > to reproduce, where xhci_hcd doesn't handle endpoint_reset() after
> > endpoint_disable() not followed by add_endpoint(). If a configured
> > device is reset, stalling endpoints start to get stuck permanently.
> > 
> > Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > Closes: https://lore.kernel.org/linux-usb/c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de/
> > Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> > ---  
> 
> All xhci changes look good to me
> 
> Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Thank you for the review.

I guess I should update the commit message, though?

Technically, the regression will be closed by the next usb-linus merge
due to EP_STALLED reverts, while this patch really fixes and old hidden
bug which I could probably do a better job at explaining.

Greg would like a "Fixes". I think the problem started somewhere here:
f5249461b504 xhci: Clear the host side toggle manually when endpoint is soft reset
18b74067ac78 xhci: Fix use-after-free regression in xhci clear hub TT implementation

The former introduced an endpoint_reset() which depends on ep->hcpriv,
the latter introduced an endpoint_disable() which clears ep->hcpriv.
Which of them was wrong depends on whether it is legal to expect hcpriv
to be preserved after endpoint_disable(), I honestly don't know.

I also don't know if it will make sense to fix this in stable, since
nobody apparently noticed before EP_STALLED. But a class driver which
tries to clear a not halted EP on a device that had been reset in the
past could create toggle mismatch. I have not yet found such a driver.

Michal
