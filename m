Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C458D1A23B5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040999; cv=none; b=EqHyD2aPI7+5JV3PmA3xTwJzAMSs9m2gcVPBhHDpaqReqqIK//+OVavKhRMFNfuqCnWTN/Kz16F4QKWjgFnWRz13XAfJb12DaoqQdOzOiPWWUWRZQIxqDItd4n+kS20QXKw/2QyVX8ygoLQOtVvrJXkuzZg26khdWg07ps7+gz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040999; c=relaxed/simple;
	bh=5BCZIdNRkhUIBdY64OeUY7sVGNbJ/g40WgIHT6thUNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfiAbblE7EyWYOwA2MwFSPNwclzVmAi+WMgkELdisXwNf0FIAWHU5In99It75u5lLGHe+RaUlrYb8cXEkLRbyfcWd78x/h7ojpSnmQ9TFW77XI/oaDgnpQ5ThucH9ox9UqpLn3/yNjcB6yj11qlBtdDWyuFuyuKLkO3yP+mG4Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jolddWY/; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jolddWY/"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72c27166ab3so41543a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751040997; x=1751645797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DPbqcYbTYh3za1zv46G3MUpPRWr3UKkA5XAz/GSvqf4=;
        b=jolddWY/3aZ9enPw3XXInGd9+gzYuL44Wsuz1Zv9aePe2wzhv3yFSrFaYBBbcOGO2z
         YjF8iLhF3NXSbcGDU9tMXtUStDJVs6Rd7lLu5epG/M4h91rYUlcOkpyhfoyTR4ZSGSpD
         v7MOkoWaZYpoMiV2JeDJg0+IbBDNsu6qkmHvy+VtimIMK19d63EacB/pnKR/QaIwL4rz
         e/z978ezE12fhTmw057+yDRTqEolmTNlIzQ3fxndxf1Za3tQ5OMc/AcAY4LDK7KfARQs
         iaZ8SVmmtdIIf/MFtTPVMw0fKBn76ppVe0OeOQek7tGKT3wffUkAa1DdbjmxMgRK8xge
         FUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751040997; x=1751645797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPbqcYbTYh3za1zv46G3MUpPRWr3UKkA5XAz/GSvqf4=;
        b=g/e8N+wvolYl1ZzYODIJyBbqHT3QJE+b3ASwzORfmc+njdyZn+SCirZ92m4XC8ckMQ
         H/DKCFOmEhqTresCH011CuoEEvM1v+5uOsZxKbgLnKyFj7LhGVH3LKoSOexm1D34Vvzx
         5QOsmpzDUd+1M5mPI7+m8E+YQny1ipj9OViCNzEZyWqTcZB/OlO8brO2u8hC/w0/L8Vh
         TbSgsvCuAL9TA1ptAi/TP1KrOq0MoLddr7ESd7luRwSRoCq4hd/KrGLPjGtwVhZDaSBc
         9c80+wYvRqSd2MZxvJNIerz0TkuIlMYQ/sXuHsVGJbFxSRvgwkM1ERFO/SB3iQReCPIk
         L33w==
X-Forwarded-Encrypted: i=1; AJvYcCVWFLr/urgalXpAgsshGvyvVvP7uhuiFQLWKlC57wJrbLeRke87A9rY16gWdmtsFv5gyJc6+ZvD8BIJ/mU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7500fcFcoYUuefWWhvY8I15gLpVc9Lkg9kFRVLrlJdqkor9GJ
	ke0Gsgrw3ksmWEuAkVw4cUhOg35Zdda5qqfqhnyVSHu6jjkqfXS1/swTPaN8N2uLzd8=
X-Gm-Gg: ASbGncu5DNG2/1ViTRMzMqd99GAYqWqFVEfOv4Bq43IPicSRclX8o9JIHYYOUrkRnF6
	oXc/VbQgCe/044ZccVDNU/QIh1wNyWJdIFH6MWfhIaoKi1vKzxu9iKx1tk4nyJqFB1emrN0Rr2A
	e6kBcPk+z0bfXW+rbT7ZbK5nlLBVMsaIP4gL9JAB8X4bsxJ8c9wqIT8u7CubeNSz1bj2sCNp8QI
	oUYwqfp/1f9CrrWzC0FtlGcDt7dS5Ijt4SDPXe1x9RJySbIbOFCetikDdyXKEhMINd/cRpaJw0o
	n9HePQgci7OancSc/DVccs+i9WyG54OPmhqHiUqvtMVawpZag/yenLgUYNY8yxC5XCL9HA==
X-Google-Smtp-Source: AGHT+IHSu+h2Kzxlf1fk0VB81UI24jyMyrVK0+P5Y1H7EQ3VQt8CFFGwqHkfpVATJdlBq2OYHofbSQ==
X-Received: by 2002:a05:6830:4d87:b0:727:3f3e:53bb with SMTP id 46e09a7af769-73afc600f17mr2265204a34.24.1751040996481;
        Fri, 27 Jun 2025 09:16:36 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb0e2ed7sm406749a34.35.2025.06.27.09.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:16:36 -0700 (PDT)
Date: Fri, 27 Jun 2025 19:16:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6] staging: media: atomisp: apply clang-format and fix
 checkpatch.pl errors
Message-ID: <0256dbd4-a08d-4549-a520-63ee88eb3c1f@suswa.mountain>
References: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com>

Heh.  No.  This patch is way way way to giant.  It's 80 thousand lines
long.  Anything longer than a few hundred lines is probably suspect.

regards,
dan carpenter

