Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB71E2116F5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343157; cv=none; b=lK0j7J4MhRTb7UD4N6t6JCyfPDrTJoEzZJ49cLhUKhprpglENF2/LD5xZfEhrrGiTylg5Ys2yMgJSD1Pi6HhCOB2i6U+h4BMMZXe3sSV14qYMfaxzyoMOkFRd9aJqFXaVzRV8NxMX7Hfl25uw9xZopS2B5d/dU1c3AVcB/RyaW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343157; c=relaxed/simple;
	bh=XivIsKtLHxsnTwVlRhl4Dr8yCQ88AWH5wGjsQuso/gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYVOniee9kd84/d5nhvhgQzWEq7boJvooCluRP/0HtDD3n05siq9UqdAAkIFq1LwNpHxcKdQItHp/dnohJA61Qnt+xl8YYJ9tCLmSpDb3cjzMDLGepFM3HO2zulwcAjmyu4X0fl3TCtExfU+Fi8msrMFfdurHOQNF4xlDIXCg+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=RfXK4v/A; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="RfXK4v/A"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c597760323so69569285a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750343154; x=1750947954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aDxodWZZFiLGzD+rmeop7HWG34rN9saTSNItB0iBSXQ=;
        b=RfXK4v/AQrQn8u1D6IQkkveHHV7R8mSRQC3iwZ5WF9TNBqVE50bOk/nA56/RlroWF8
         WsO8aDcQWq81dQjIRcnQuYly4BgJvCIPCYMcY6dW4nrobOpcbj5AlWhUIPp7JhIfJ702
         AZY4fqqzVZi6BkDYKMiJl1NtYuTUF9X6VYW/wZYfz2mxUkkDH0hsLqW0YgeqolVmuLdK
         XWs9iJlT+90wxRaccg9ESb5aqRdtZdw+tDxGewasHaNoL2dx2JSg7PycwpF55wzAUEt/
         f4y7K7u4+KVtmb1TKmV2/gPy5uoslLQcB1KZr2pS9YoFylRlFMpfdpSEVMxNWUfHvzb5
         F9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343154; x=1750947954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDxodWZZFiLGzD+rmeop7HWG34rN9saTSNItB0iBSXQ=;
        b=XSVMib3paXm+MnC3XmKAYB+MqPqgsHV5iW1dmCmbc/ntJ37Wj4KDF5rFtmUt0HjDzx
         kxcoEk2jawhbo1fzYLrgimaVn9tlItNWF0LRKVlwB/ILdg4zDWivNq+Gw1CBGbKHhXMZ
         IwTG2LXxKgKruM43jhTt303eNzVIkyi/5GJ2swQZnNKNX80OecH8vRbmEXd+iDwkUHu9
         pFFoQa1w+NG0lCqUEup8nHQehdA+a5r1feunwYKtiEBE6HQR+qMcw1UR+XvFrYH9vz/i
         zoc5642cVMoVSKOCswn2f/RAQc733nK7tPjiKXdThlnWcouWuQ3J7Dl86Ss+dUVnuC1j
         yXzw==
X-Forwarded-Encrypted: i=1; AJvYcCXtNyKuqiMPgzmyKCSau0OYKtAhvJ1Q9hYbSLRVJUMlSNcriBhTput1JtdiQedufe9BLwbdPBXWG4N+390=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKxeJBhD9FbtcMLfaGO4B7WNEWJ6u7g3XdWRlEoQTNnOKzG4Ij
	B/6Tre/xFCUNzM3OdE4c6ojDpkxf2R/JTRxuIuFo6U/K+vbD7WpHXfnbBLbX+0SqBQ==
X-Gm-Gg: ASbGncsqMaMrXYGRAk6jR+NZdoNCphV3AK/0X9BwX6k+bQY1qm4jwD6eYevJN9d+Vxy
	IF5FxwRKcGgYrJuZcLUXbwCpGFP7/QFdWvwvQ76833y4mGf1MOdWJsEkcGFb3seZoShThUY0b77
	kO436LF2v8T/ticjQgHYfjXKYEnTm0oxNPIrrwFDukM+45yYxCgw2D2AO3sbYpL3E7MscN+ZUTr
	tAiM8KzHANMYe7i+tIociGyrRcGqkYvKg87lFGdHBxf6COjrFyRXf0yBBnjmyBu19eFGWAwfs8p
	lyGfRWw/0B37TtsiLOv+g3j586GV32YlqhtA+IPNbjrBZKpWf1wA5iXsSVSOavA=
X-Google-Smtp-Source: AGHT+IHoxGFmOWyxo0l5cv3zNYUJJmLzJxOJmUnEXBZTUwO3KalFcEgAIn0/tUUNPftUnsVKxRmxVg==
X-Received: by 2002:a05:620a:2a11:b0:7d0:99dc:d026 with SMTP id af79cd13be357-7d3c6c0c737mr2951152985a.12.1750343153662;
        Thu, 19 Jun 2025 07:25:53 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::9ca8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f8dc9378sm3558485a.9.2025.06.19.07.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:25:53 -0700 (PDT)
Date: Thu, 19 Jun 2025 10:25:50 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: gregkh@linuxfoundation.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ehci: replace scnprintf() with sysfs_emit()
Message-ID: <20d37e05-c496-499a-97a2-bcde9b7fe958@rowland.harvard.edu>
References: <20250619120711.552662-1-hendrik.hamerlinck@hammernet.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619120711.552662-1-hendrik.hamerlinck@hammernet.be>

On Thu, Jun 19, 2025 at 02:07:11PM +0200, Hendrik Hamerlinck wrote:
> Per Documentation/filesystems/sysfs.rst, show() methods should only
> use sysfs_emit() or sysfs_emit_at() when formatting values to be
> returned to userspace.
> 
> Convert the uses of scnprintf() in sysfs show() methods to
> sysfs_emit() and sysfs_emit_at() for better safety and consistency.
> 
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
