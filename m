Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158CB1B0435
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352384; cv=none; b=sWnndxMbwebw8xXckdUyaavtTIY9BTe9QcD/hCpMibvd0BRsNvvmeT7aBtBdBxIfyfN0NxO8Lw6IoIw1/+rIPFufkAdIm9/9Y1mUSnPjkZXwiFuUZkYRZM0N+V+GctKCZWqbACOKd75JKTkzL13MhgqmmrwTEnXMnx8yC2nuERk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352384; c=relaxed/simple;
	bh=5Y7c6zYkKzF3xCBRV8XTIbt5q1FllIz2uRSBkOMN2pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/8Ps+jiz0+7h9EBFs3y8IYZNs6+jwV/n80ylVZi8le3xuYVK9nV4H2jjfQTi0gnmBYPydt78kgh+Pi0DjSBrVdLex9lwylnDP6r1fepQ5jWsnjMIAi8G5zwTxGtx7bSjzHoyAt2PaqgSEtSifBk6yaDyhUqvwv5QVLvilqO/H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso2834586f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751352381; x=1751957181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Y7c6zYkKzF3xCBRV8XTIbt5q1FllIz2uRSBkOMN2pI=;
        b=HneffRDumClCGKD3Y6boCXHNltn43kWR+ZxtoRUGcqflcopkn999hkPOn4m+sf6o6r
         GmNoFYiGOr5HjzeJbVp2Ia0mswKRYGZeO+8lgyzjKK9n48j3g6BeMK+lhLlOFhuquDqv
         MAy8xmSM4PQXhWNX3O8vaCsogBtLnO2vae904ENSFHp9xqZwuQsMVmCDZzlNoWvIT/2p
         sP7Nh65+tG0ocwnHknE0+5vdMKtNg4DnD33+XqZ2qVzyHGS/EVL4WKyBY/raCFIFsCLL
         hbASAUtmIm9yUJp/Ut9riP5Z5uRUULFiaqYGjGzURjY/zYzOO6VWPoGTUl+urjji8zcn
         Lw9A==
X-Gm-Message-State: AOJu0Yy5EXIp/VQJcLzyXZwkc+9Eprs8ztk9zT3IcQSodZ2d1WGz5QPu
	72oPNYRhpb09NEJVHrdNcBnVI7xwfUfRYhoQ6uqIwPPW+cBSFG/10AfRenrApQ==
X-Gm-Gg: ASbGncueXGPKqi0kY970IcGJARx1uQnkpHm1pYxw0skVpCnMUnMuZZYXX7f4HetTdaf
	tnSDu7ToQvdvH9mOFW9kmLNA4HxrQb6aGlgwGv22MVt0MJN6CuRU8tPTMvkG6qSA2Tec5gBqnxz
	Zd8PUmEVTHbghYS1Qi7uWnqoMKxhsmaUNsUqwJYZX2rqOUZ0QrPVSfnxP/TsDFdligc8NL8Kjst
	ifZTtLYSAmZ0X2XRFYYG2YqstfktjB7ioQbQOJuzVMZSr6nr+/HepV1bv0iuh3YLViD9HME4DW8
	WuxS4bG8N6oZzB6Q8NBibEx8EkjCRM8dUUK89wVagxI9KhV0mueI3Q6+Qu7nYTaZRFyMTu+DADy
	Ja2JF7YMb7U5RF8h6xrNbSxKrOtEBjC0=
X-Google-Smtp-Source: AGHT+IH81P1+bFEH6Zw1ZvScH7bK2A/izH2xyZPsDw9Idyk2cEeCBzoWdGS1K1KmarW+mBoXRV0C4w==
X-Received: by 2002:a05:6000:2811:b0:3a6:d95e:f38c with SMTP id ffacd0b85a97d-3a8ffdbef33mr10531002f8f.33.1751352381001;
        Mon, 30 Jun 2025 23:46:21 -0700 (PDT)
Received: from nuc (p200300f6f72c4000fa633ffffe02074c.dip0.t-ipconnect.de. [2003:f6:f72c:4000:fa63:3fff:fe02:74c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7518sm12144193f8f.2.2025.06.30.23.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:46:20 -0700 (PDT)
Date: Tue, 1 Jul 2025 08:46:18 +0200
From: Johannes Thumshirn <jth@kernel.org>
To: herculoxz <abhinav.ogl@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Replace the use of scnprintf() with sysfs_emit_at() in
 several show functions to format the output into the sysfs buffer.
Message-ID: <aGOEOu7-oh1Nb9mm@nuc>
References: <20250629175330.5834-1-abhinav.ogl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629175330.5834-1-abhinav.ogl@gmail.com>

On Sun, Jun 29, 2025 at 11:23:30PM +0530, herculoxz wrote:
> This change improves clarity and ensures proper bounds checking in
> line with the preferred sysfs_emit() API usage for sysfs 'show'
> functions. The PAGE_SIZE check is now handled internally by the helper.


Can you please a) add an 'mcb:' prefix to the subject and b) make it fit into
~75 chars?

Code wise it looks ok:

Reviewed-by: Johannes Thumshirn <jth@kernel.org>
